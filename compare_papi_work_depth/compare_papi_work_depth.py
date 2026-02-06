import argparse
import traceback
import subprocess
import re
import copy
import os
import importlib
import multiprocessing as mp
import json

import dace.transformation.auto.auto_optimize as opt
from datetime import datetime, timezone
from collections import defaultdict
from math import sqrt
from statistics import median

import sympy as sp
import dace
import dace.sdfg.performance_evaluation.work_depth as wd
from dace.config import Config
from dace.codegen.instrumentation import papi

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)

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
    repetitions = 1
    preset = args["preset"]
    
    results = {}
    w_succ = []
    w_fail = []
    no_diff = []
    for benchmark_name in benchmarks:
        print("="*50, benchmark_name, "="*50)
        benchmark = Benchmark(benchmark_name)

        sdfg, simplified_sdfg = get_bench_sdfg(benchmark, dace_cpu_framework)
        bdata = benchmark.get_data(args["preset"])
        
        try:
            opt.auto_optimize(sdfg, dace.dtypes.DeviceType.CPU)
            wd.analyze_sdfg(sdfg, {}, wd.get_tasklet_work_depth, [], False)
            print("succ")
            w_succ.append(benchmark_name)
            
        except:
            w_fail.append(benchmark_name)
            traceback.print_exc()
        """for event_set in [{"PAPI_DP_OPS"}]:
            try:
                papi.PAPIInstrumentation._counters = event_set   
                

                sdfg.instrument = dace.InstrumentationType.PAPI_Counters

                substitutions = benchmark.info["parameters"][preset]
                print(preset, benchmark.info["parameters"][preset])
                print("L:", benchmark.info["parameters"]['L'])
                try:
                    work, depth = wd.analyze_sdfg(sdfg, {}, wd.get_tasklet_work_depth, [], False)
                except:
                    traceback.print_exc()
                c_sdfg = sdfg.compile()

                
                

                time_list = []
                
                for i in range(5):
                    copy_data = copy.deepcopy(bdata)
                    _ , raw_time_list = util.benchmark("c_sdfg(**copy_data)", context=locals(), verbose=False, repeat=1)
                time_list.extend(raw_time_list)
                    
                new_reports = sorted(sdfg.get_instrumentation_reports(), key=lambda report: report.name, reverse=True)[0:5]

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
                                
                                ws = work.subs(substitutions)

                                results[benchmark_name] = {"PAPI": event_sum, "Work": str(ws)}
                                print("PAPI_DP_OPS:", event_sum, "Work depth:", ws, "Diff:", abs(event_sum-ws))
                                if abs(event_sum-ws) == sp.sympify(0):
                                    no_diff.append(benchmark_name)   
            
            except Exception as e:
                print(e)
                traceback.print_exc()
                continue
            results["no_diff"] = no_diff
            print(work.subs(substitutions))"""
    print(len(w_succ), w_succ, "\n",
           len(w_fail), w_fail)
    with open('result.json', 'w') as fp:
        json.dump(results, fp, indent=4)
    print(no_diff, len(no_diff))