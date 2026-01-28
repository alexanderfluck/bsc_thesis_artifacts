import argparse
import traceback
import subprocess
import re
import copy
import os
import importlib
import multiprocessing as mp

from datetime import datetime, timezone
from collections import defaultdict
from math import sqrt
from statistics import median
import dace.transformation.auto.auto_optimize as opt


import dace
from dace.config import Config
from dace.codegen.instrumentation import papi

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
                  'conv2d_bias','correlation',# 'covariance2', --> cov 2 dace does not exist
                  'covariance','crc16','deriche',#'doitgen', --> doitgen, auto opt fails (more precisely, expand_library_nodes())
                  'durbin','fdtd_2d','floyd_warshall','gemm',
                  'gemver','gesummv','go_fast','gramschmidt',
                  'hdiff','heat_3d','jacobi_1d','jacobi_2d','k2mm','k3mm','lenet','ludcmp','lu','mandelbrot1',
                  #'mandelbrot2', --> mandelbrot2, auto_opt fails
                  'mlp','mvt','nbody','nussinov','resnet','scattering_self_energies','seidel_2d',
                  'softmax','spmv',# 'stockham_fft', --> stockham_fft compilation fails
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

    start = (int(datetime.now(timezone.utc).timestamp() * 1000))
    first_bench = True
    wd_fail=[]
    ba_fail=[]
    rw_fail=[]
    oi_fail=[]
    wd_no_fail = []
    comp_fail = []

    timeout_fail = []
    error_fail = []
    import dace.sdfg.performance_evaluation.work_depth as wd
    """import dace.sdfg.performance_evaluation.may_access_analysis as maa"""
    import dace.sdfg.performance_evaluation.total_volume as tv 
    """import dace.sdfg.performance_evaluation.operational_intensity as oi"""
    substitute = True
    
    for benchmark_name in benchmarks:
        print("="*50, benchmark_name, "="*50)
        benchmark = Benchmark(benchmark_name)
        sdfg, simplified_sdfg = get_bench_sdfg(benchmark, dace_cpu_framework)
        sdfg.save(f"{benchmark_name}_non_op.sdfg")
        
        opt.auto_optimize(sdfg, dace.dtypes.DeviceType.CPU)
        substitutions = benchmark.info["parameters"][preset]
        print(substitutions)
        #opt.auto_optimize(sdfg,dace.dtypes.DeviceType.CPU)
        sdfg.save(f"{benchmark_name}.sdfg")
        try:

            print(wd.analyze_sdfg(sdfg, {}, wd.get_tasklet_work_depth, [], False) )
            wd_no_fail.append(benchmark_name)  
            """if substitute:
                work = work.subs(substitutions)    
                depth = depth.subs(substitutions)         
            print("[Not simplified] Work:", work, "Depth:", depth)"""
            pass
        except Exception as e:
            print(traceback.print_exc())
            wd_fail.append(benchmark_name)
        """ print("------ Read Write Sets")
        try:
            read, write = maa.analyze_sdfg(sdfg)
            read_simpl, write_simpl = maa.analyze_sdfg(sdfg)
            print("Read:", read, "Write:", write)
            sdfg.save("jacobi_2d.sdfg")
            print("[Not simplified] \nRead:", read, "\nWrite:", write)
            for k, v in read.items():
                print(f"{k}: {v.subset_list}")
            approx_v = maa.approximate_total_volume(sdfg, substitutions)
            print("Approx total volume:", approx_v)

        except Exception as e:
            print(traceback.print_exc())
            rw_fail.append(benchmark_name)
        """
        print("------ Read Write Volume")
        try:
            vol_r, vol_w = tv.analyze_sdfg(sdfg)     
            print(vol_r, vol_w)       
            if substitute:
                vol_r = vol_r.subs(substitutions)
                vol_w = vol_w.subs(substitutions)
            print("Volume read:", vol_r, "Volume write:", vol_w)
        except Exception as e:
            print(traceback.print_exc())
            ba_fail.append(benchmark_name)

        TIMEOUT = 20 * 60  # 20 minutes

        try:
            sdfg.compile()     
        except Exception as e:
            print(traceback.print_exc())
            comp_fail.append(benchmark_name)

        """def analyze_worker(q, oi, sdfg, substitutions):
            try:
                assumptions = {k: 4 for k in substitutions}
                oi = oi.analyze_sdfg_op_in(sdfg, {}, 2048, 64, assumptions)
                print(oi)
                q.put(("success", None))
            except Exception:
                q.put(("error", traceback.format_exc())) 

        q = mp.Queue()
        p = mp.Process(
            target=analyze_worker,
            args=(q, oi, sdfg, substitutions),
        )

        p.start()
        p.join(TIMEOUT)

        if p.is_alive():
            # ⏰ Timeout
            p.terminate()
            p.join()
            timeout_fail.append(benchmark_name)

        else:
            status, payload = q.get()
            if status == "error":
                print(payload)
                error_fail.append(benchmark_name)
            else:
                print("OI:")

        bdata = benchmark.get_data(args["preset"])"""

    end = (int(datetime.now(timezone.utc).timestamp() * 1000))
    print("Duration:",  (end - start)/(1000*60), "min")
    print("Work depth failed for: ", wd_fail)
    print("May access failed for: ", rw_fail)
    print("Total vol failed for:", ba_fail)
    print("OI timed out for: ", timeout_fail)
    print("OI failed for: ", error_fail)
    print("compilation failed for", comp_fail)
    print("WD no fail:", wd_no_fail)