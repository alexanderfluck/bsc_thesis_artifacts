import argparse
import traceback
import subprocess
import re
import copy
import os
import importlib
import multiprocessing as mp

import dace.transformation.auto.auto_optimize as opt
from datetime import datetime, timezone
from collections import defaultdict
from math import sqrt
from statistics import median

import dace
from dace.config import Config
from dace.codegen.instrumentation import papi

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)

#################### SQL for creating tables and inserting values ##################################
event_averages_table_sql = """
CREATE TABLE IF NOT EXISTS event_averages(
    collection_script_timestamp integer NOT NULL,
    repetitions integer NOT NULL,
    benchmark text NOT NULL,
    preset text NOT NULL,
    event_name text NOT NULL,
    average real NOT NULL,
    median integer NOT NULL,
    variance real NOT NULL,
    standard_dev real NOT NULL,
    standard_dev_percent real NOT NULL,
    time real,
    PRIMARY KEY (collection_script_timestamp, benchmark, event_name)
);
"""
insert_into_averages_table_sql = """
INSERT INTO event_averages(
    collection_script_timestamp, repetitions, benchmark, preset, event_name, average, median, variance,
    standard_dev, standard_dev_percent, time
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
"""


event_counts_table_sql = """
CREATE TABLE IF NOT EXISTS event_counts(
    report_timestamp integer NOT NULL,
    report_path text NOT NULL,
    collection_script_timestamp integer NOT NULL,
    benchmark text NOT NULL,
    preset text NOT NULL,
    event text NOT NULL,
    total_count integer NOT NULL,
    time real NOT NULL,
    PRIMARY KEY (report_timestamp, event)
);
"""
insert_into_event_table_sql = """
INSERT INTO event_counts(
    report_timestamp, report_path, collection_script_timestamp, benchmark, preset, event, total_count, time
) VALUES (?, ?, ?, ?, ?, ?, ?, ?);
"""
############################################ SQL end ############################################################


######################################## Helper Functions #######################################################

def get_bench_sdfg(bench:Benchmark, dace_framework:DaceFramework):
        module_pypath = "npbench.benchmarks.{r}.{m}".format(r=bench.info["relative_path"].replace('/', '.'),
                                                            m=bench.info["module_name"])
        if "postfix" in dace_framework.info.keys():
            postfix = dace_framework.info["postfix"]
        else:
            postfix = dace_framework.fname
        module_str = "{m}_{p}".format(m=module_pypath, p=postfix)
        func_str = bench.info["func_name"]

        ldict = dict()
        # Import DaCe implementation
        try:
            module = importlib.import_module(module_str)
            ct_impl = getattr(module, func_str)

        except Exception as e:
            print("Failed to load the DaCe implementation.")
            raise (e)

        ##### Experimental: Load strict SDFG
        sdfg_loaded = False
        if dace_framework.load_strict:
            path = os.path.join(os.getcwd(), 'dace_sdfgs', f"{module_str}-{func_str}.sdfg")
            try:
                strict_sdfg = dace.SDFG.from_file(path)
                sdfg_loaded = True
            except Exception:
                pass

        if not sdfg_loaded:
            #########################################################
            # Prepare SDFGs
            base_sdfg, _ = util.benchmark("__npb_result = ct_impl.to_sdfg(simplify=False)",
                                                   out_text="DaCe parsing time",
                                                   context=locals(),
                                                   output='__npb_result',
                                                   verbose=False)
            strict_sdfg = copy.deepcopy(base_sdfg)
            strict_sdfg._name = "strict"
            ldict['strict_sdfg'] = strict_sdfg
            simplified_sdfg, _ = util.benchmark("strict_sdfg.simplify()",
                                            out_text="DaCe Strict Transformations time",
                                            context=locals(),
                                            verbose=False)
            # sdfg_list = [strict_sdfg]
            # time_list = [parse_time[0] + strict_time[0]]
        else:
            ldict['strict_sdfg'] = strict_sdfg

        ##### Experimental: Saving strict SDFG
        if dace_framework.save_strict and not sdfg_loaded:
            path = os.path.join(os.getcwd(), 'dace_sdfgs')
            try:
                os.mkdir(path)
            except FileExistsError:
                pass
            path = os.path.join(os.getcwd(), 'dace_sdfgs', f"{module_str}-{func_str}.sdfg")
            strict_sdfg.save(path)

        return base_sdfg, simplified_sdfg

######################################## Helper Functions end ###################################################

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("-p",
                        "--preset",
                        choices=['S', 'M', 'L', 'paper'],
                        nargs="?",
                        default='S')
    parser.add_argument("-v",
                        "--validate",
                        type=util.str2bool,
                        nargs="?",
                        default=True)
    parser.add_argument("-e",
                        "--build_event_sets",
                        type=util.str2bool,
                        nargs="?",
                        default=True)
    parser.add_argument("-r", "--repeat", type=int, nargs="?", default=10)
    parser.add_argument("-b", "--benchmarks", type=str, nargs="+", default=None)

    args = vars(parser.parse_args())

    benchmark_set = ['adi','arc_distance','atax','azimint_hist','azimint_naive','bicg',
                  'cavity_flow','channel_flow','cholesky2','cholesky','compute','contour_integral',
                  'conv2d_bias','correlation',#'covariance2',
                  'covariance','crc16','deriche',#'doitgen',
                  'durbin','fdtd_2d',
                  'floyd_warshall','gemm',
                  'gemver','gesummv','go_fast','gramschmidt',
                  'hdiff','heat_3d','jacobi_1d','jacobi_2d',
                  'k2mm',
                  'k3mm','lenet','ludcmp','lu','mandelbrot1',
                  'mandelbrot2','mlp','mvt','nbody','nussinov','resnet','scattering_self_energies','seidel_2d',
                  'softmax','spmv',#'stockham_fft',
                  'symm','syr2k','syrk','trisolv','trmm','vadv']
    
    benchmarks = list()
    if args["benchmarks"]:
        requested_bms = []
        for benchmark_name in args["benchmarks"]:
            if benchmark_name in benchmark_set:
                benchmarks.append(benchmark_name)
            else:
                print(f"Could not find a benchmark with the name {benchmark_name}")
    else:
        benchmarks = list(benchmark_set)
    

    dace_cpu_framework = DaceFramework("dace_cpu")
    repetitions = args["repeat"]
    preset = args["preset"]

    # create a database connection
    database = r"npbench_likwid_metrics_autoopt.db"
    conn = util.create_connection(database)
    run_id = int(datetime.now(timezone.utc).timestamp() * 1000)

    util.create_table(conn=conn, create_table_sql=event_averages_table_sql)
    
    first_bench = True
    for benchmark_name in benchmarks:
        print("="*50, benchmark_name, "="*50)
        benchmark = Benchmark(benchmark_name)
        sdfg, simplified_sdfg = get_bench_sdfg(benchmark, dace_cpu_framework)
        bdata = benchmark.get_data(args["preset"])

        try:
            opt.auto_optimize(sdfg, dace.dtypes.DeviceType.CPU)
        except:
            pass
        if first_bench:
            util.create_table(conn=conn, create_table_sql=event_counts_table_sql)
        try:
            sdfg.instrument = dace.InstrumentationType.LIKWID_CPU

            c_sdfg = sdfg.compile()

            time_list = []
            for _ in range(repetitions):
                run_bdata = copy.deepcopy(bdata)
                #warmup
                c_sdfg(**run_bdata)
                #measured run
                _, raw_time_list = util.benchmark("c_sdfg(**run_bdata)", context=locals(), verbose=False, repeat=1)
                time_list.extend(raw_time_list)
              
            new_reports = sorted(sdfg.get_instrumentation_reports(), key=lambda report: report.name, reverse=True)[0:repetitions]

            event_sums = dict()
            for i, report in enumerate(reversed(new_reports)):
                for uuid in report.counters:
                    for sdfg_element in report.counters[uuid]:
                        for event_name in report.counters[uuid][sdfg_element]:
                            event_sum =  0
                            for tid in report.counters[uuid][sdfg_element][event_name]:
                                event_sum+=report.counters[uuid][sdfg_element][event_name][tid][0]
                            
                            if event_name not in event_sums.keys():
                                event_sums[event_name] = []
                            
                            event_sums[event_name].append(event_sum)
                            util.create_result(conn, insert_into_event_table_sql, tuple([int(report.name), str(report.filepath), run_id, benchmark_name, preset, event_name, event_sum, time_list[i]]))
            for event, sums in event_sums.items():
                event_average = sum(sums)/repetitions
                event_median = median(sums)
                event_variance = sum([(counter_value-event_average)**2 for counter_value in sums])/repetitions
                event_stddev = sqrt(event_variance)
                time_average = sum(time_list)/repetitions
                stddev_perc = event_stddev/(event_average)*100 if event_average>0 else -1
                print(
                    f"{event:<14} | "
                    f"Max: {max(sums):>16.4f} | "
                    f"Min: {min(sums):>16.4f} | "
                    f"Avg: {event_average:>16.4f} | "
                    f"Var: {event_variance:>20.4f} | "
                    f"StdDev: {event_stddev:>16.4f} | "
                    f"StdDev%: {stddev_perc:>16.4f}%"
                )
                util.create_result(conn, insert_into_averages_table_sql, tuple([run_id, repetitions, benchmark_name, preset, event, event_average, event_median, event_variance, event_stddev, stddev_perc, time_average]))

        except Exception as e:
            print(e)
            traceback.print_exc()
            continue 
        first_bench = False
    end = (int(datetime.now(timezone.utc).timestamp() * 1000))
    diration = (end - run_id)
    print("Duration:",  (end - run_id)/(1000*60), "min")