import argparse
import traceback
import subprocess
import re
import copy
import os
import importlib
import multiprocessing as mp
import pandas as pd
from datetime import datetime, timezone
from collections import defaultdict
from math import sqrt
from statistics import median
from dace.sdfg.performance_evaluation.helpers import get_uuid
from dace.sdfg.performance_evaluation.work_depth import get_tasklet_work
import dace.transformation.auto.auto_optimize as opt
from dace.transformation.dataflow.wcr_conversion import AugAssignToWCR, WCRToAugAssign
from dace.sdfg.performance_evaluation.op_in_helpers import CacheLineTracker, AccessStack, fit_curve, plot, compute_mape

import time


import dace
from dace.config import Config
from dace.codegen.instrumentation import papi
from dace.sdfg import infer_types
# branch alexanderfluck/combined

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)

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
    data_rows = []
    parser = argparse.ArgumentParser()
    #parser.add_argument("-p",
    #                    "--preset",
    #                    choices=['S', 'M', 'L', 'paper'],
    #                    nargs="?",
    #                    default='S')
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

    benchmark_set = [
  "jacobi_1d",
  "gesummv"
    ]

    
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

    for line_size in [8, 64]:
        start = (int(datetime.now(timezone.utc).timestamp() * 1000))
        ba_fail=[]

        timeout_fail = []
        error_fail = []
        import dace.sdfg.performance_evaluation.total_volume as tv 
        import dace.sdfg.performance_evaluation.operational_intensity as oi
        substitute = True
        
        for benchmark_name in benchmarks:
            print("="*50, benchmark_name, "(", line_size, ")", "="*50)
            benchmark = Benchmark(benchmark_name)
            sdfg, simplified_sdfg = get_bench_sdfg(benchmark, dace_cpu_framework)
            #base_sdfg = copy.deepcopy(sdfg)
            #infer_types.set_default_schedule_and_storage_types(base_sdfg)

            sdfg.expand_library_nodes()
            substitutions = benchmark.info["parameters"]['L']
            sdfg.save(f"{benchmark_name}_expanded.sdfg")
            infer_types.set_default_schedule_and_storage_types(sdfg)
            if benchmark_name != "azimint_hist" and benchmark_name != "azimint_naive":
                sdfg.apply_transformations_once_everywhere(WCRToAugAssign)

            try:
                vol_r, vol_w = tv.analyze_sdfg(sdfg)
                op_in_map = {}
                assumps = {k: '35,45,1' for k in substitutions}
                if benchmark_name == "jacobi_1d":
                    assumps['TSTEPS'] = 5
                mapping = {}
                static_symbols = oi.get_static_symbols(sdfg)
                stack = AccessStack(512)
                clt = CacheLineTracker(64)

                sim_start = (int(datetime.now(timezone.utc).timestamp() * 1000))
                op_in, fitted_func= oi.analyze_sdfg_op_in(sdfg = sdfg, op_in_map= op_in_map, C= 512, L= 64, assumptions= assumps)
                sim_end = (int(datetime.now(timezone.utc).timestamp() * 1000))
                # Save to the list as a dict
                data_rows.append({
                    "kernel": benchmark_name,
                    "OI_fitted_func": fitted_func,
                    "line_size": line_size,
                    "sim_time_sec": (sim_start - sim_end)/(1000*60),
                    "Volume_total_tv": str(vol_r + vol_w),
                    "Vol_read_tv": str(vol_r),
                    "Vol_w_tv": str(vol_w)
                })
            except Exception as e:
                print(traceback.print_exc())
                ba_fail.append(benchmark_name)

    end = (int(datetime.now(timezone.utc).timestamp() * 1000))
    # Convert list of dicts to DataFrame
    df_volumes = pd.DataFrame(data_rows)
    # Save to CSV
    df_volumes.to_csv("volumes_per_preset_3.csv", index=False)
    print("Duration:",  (end - start)/(1000*60), "min")
    print("Total vol failed for:", ba_fail)