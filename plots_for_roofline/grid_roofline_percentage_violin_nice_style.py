import argparse
import copy
import os
import importlib
import json
import pathlib
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.ticker import FuncFormatter

import dace
from dace.config import Config
from dace.codegen.instrumentation import papi

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)
import dace.sdfg.performance_evaluation.work_depth as wd
import dace.sdfg.performance_evaluation.total_volume as tv 

import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument("-r", "--rows", type=int, default=6, help="Number of rows in the grid")
parser.add_argument("-c", "--cols", type=int, default=9, help="Number of columns in the grid")
args = parser.parse_args()

import sqlite3
def read_sqlite_db(db_path: pathlib.Path):
    print(f"\n=== Database: {db_path} ===")

    conn = sqlite3.connect(db_path)
    dfs = dict()
    try:
        tables = pd.read_sql(
            "SELECT name FROM sqlite_master WHERE type='table';", conn
        )["name"].tolist()

        if not tables:
            print("  (No tables found)")
            return

        for table in tables:
            df = pd.read_sql(f"SELECT * FROM {table}", conn)
            dfs[table] = df
    finally:
        conn.close()
    
    return dfs



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

import seaborn as sns

def generate_grid_plot(data: dict, frameworks, benchmarks, n_cols=4):
    """
    Plots the Achieved Percentage of Roofline using the Seaborn violin style.
    """
    # 1. Convert the dictionary data into a Long-Form DataFrame for Seaborn
    rows = []
    for benchmark in benchmarks:
        bm_data = data[benchmark]
        peak_flops = bm_data["peak_achievable_flops"]
        total_flops = bm_data["total_flops"]

        for fw in frameworks:
            if fw in bm_data["timings"]:
                for t in bm_data["timings"][fw]:
                    achieved = total_flops / t
                    pct = (achieved / peak_flops) * 100
                    rows.append({
                        "Benchmark": benchmark,
                        "Framework": fw,
                        "Percentage of Roofline": pct
                    })
    
    df_plot = pd.DataFrame(rows)

    # 2. Setup Figure Grid
    sns.set(style="whitegrid")
    n_rows = (len(benchmarks) + n_cols - 1) // n_cols
    fig, axes = plt.subplots(n_rows, n_cols, figsize=(4.5 * n_cols, 3.5 * n_rows), squeeze=False)
    
    # Define the color palette used in your colleague's style or custom
    fw_palette = {
        'cupy': '#17becf', 'dace_cpu': '#f7a3ff', 'dace_gpu': '#9467bd',
        'numba': '#1f77b4', 'pythran': '#2ca02c', 'triton': '#ff7f0e',
        'jax': '#d62728', 'numpy': '#d627aa'
    }

    # 3. Plotting loop
    for i, benchmark in enumerate(benchmarks):
        ax = axes[i // n_cols, i % n_cols]
        bench_df = df_plot[df_plot["Benchmark"] == benchmark]
        
        if not bench_df.empty:
            sns.violinplot(
                data=bench_df,
                x="Framework",
                y="Percentage of Roofline",
                hue="Framework",
                ax=ax,
                palette=fw_palette,
                inner="box",  # This adds the mini boxplot inside
                cut=0,        # Limits violin to observed data range
                legend=False
            )
        
        ax.set_title(f"{benchmark}", fontsize=15, fontweight='bold')
        ax.set_xlabel("")
        ax.set_ylabel("% of Roofline" if i % n_cols == 0 else "")
        ax.tick_params(axis='x', rotation=0, labelsize=15)
        ax.tick_params(axis='y', labelsize=15)
        ax.set_ylim(bottom=0)
        ax.grid(True, axis='y', alpha=0.3)

    # 4. Cleanup: Hide empty subplots
    for j in range(i + 1, n_rows * n_cols):
        fig.delaxes(axes[j // n_cols, j % n_cols])

    plt.tight_layout()
    
    # Save files
    output_base = f"roofline_violin_{len(benchmarks)}bm"
    plt.savefig(f"{output_base}.pdf", bbox_inches='tight')
    plt.savefig(f"{output_base}.png", dpi=300, bbox_inches='tight')
    plt.close()
    print(f"✓ Saved: {output_base}.pdf and .png")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-p",
                        "--preset",
                        choices=['S', 'M', 'L', 'paper'],
                        nargs="?",
                        default='L')
    parser.add_argument("-b", "--benchmarks", type=str, nargs="+", default=None)
    parser.add_argument("-f", "--floating_point_peak", type=float, nargs="?", default=3456)
    parser.add_argument("-m", "--memory_peak", type=float, nargs="?", default=256)
    parser.add_argument("-d", "--database", type=str, nargs="+", default="/home/alex/Studium/bachelor_thesis/artifacts_repo/bsc_thesis_artifacts/plots_for_roofline/npbench_L_Intel.db")


    args = vars(parser.parse_args())

    dace_cpu_framework = DaceFramework("dace_cpu")
    preset = args["preset"]

    benchmark_set = {'adi','arc_distance','atax','azimint_hist','azimint_naive','bicg',
                  'cavity_flow','channel_flow','cholesky2','cholesky','compute','contour_integral',
                  'conv2d_bias','correlation',# 'covariance2', --> cov 2 dace does not exist
                  'covariance','crc16','deriche',#'doitgen', --> doitgen, auto opt fails (more precisely, expand_library_nodes())
                  'durbin','fdtd_2d','floyd_warshall','gemm',
                  'gemver','gesummv','go_fast','gramschmidt',
                  'hdiff','heat_3d','jacobi_1d','jacobi_2d','k2mm','k3mm','lenet','ludcmp','lu','mandelbrot1',
                  #'mandelbrot2', --> mandelbrot2, auto_opt fails
                  'mlp','mvt','nbody','nussinov','resnet','scattering_self_energies','seidel_2d',
                  'softmax','spmv',# 'stockham_fft', --> stockham_fft compilation fails
                  'symm','syr2k','syrk','trisolv','trmm','vadv'}
    
    
    benchmarks = sorted([bm for bm in args["benchmarks"] if bm in benchmark_set]) if args["benchmarks"] else list(benchmark_set)

    path = pathlib.Path(args["database"])

    if path.is_file():
        dfs = read_sqlite_db(path)
    elif args.path.is_dir():
        raise Exception("Directory input not supported in this version.")

    symbolic_data = pd.read_csv("volumes_per_preset.csv")
    symbolic_data = symbolic_data[symbolic_data["preset"] == preset]
    time_table = dfs["results"]

    time_table = time_table.copy()

    benchmark_rename_map = {}
    for benchmark in benchmarks:
        npb = Benchmark(benchmark)
        short_name = npb.info["short_name"]
        benchmark_rename_map[short_name] = benchmark
    
    time_table["benchmark"] = (
        time_table["benchmark"]
        .replace(benchmark_rename_map)
    )

    peak_flops = args["floating_point_peak"] *1e9
    mem_speed = args["memory_peak"] * 1e9

    # --- Compute operational intensity (OI) ---
    kernel_df = symbolic_data.copy()
    kernel_df["oi"] = (
        kernel_df["work"]
        / (kernel_df["symbolic_volume_read_bytes"] + kernel_df["symbolic_volume_write_bytes"])
    )

    # --- Build lookup dictionaries for fast access ---
    work_lookup = kernel_df.set_index("kernel")["work"].to_dict()
    oi_lookup = kernel_df.set_index("kernel")["oi"].to_dict()

    # --- Apply framework-specific filtering rules ---
    filtered_time_table = time_table[
        ~(
            ((time_table["framework"] == "numba") & (time_table["details"] != "nopython-mode")) |
            ((time_table["framework"] == "dace_cpu") & (time_table["details"] != "auto_opt")) |
            ((time_table["framework"] == "jax") & (time_table["details"] == "lib-implementation"))
        )
    ].copy()

    # --- Build the final dictionary ---
    result = {}

    for benchmark, bench_df in filtered_time_table.groupby("benchmark"):
        if benchmark not in work_lookup:
            print(benchmark)
            continue  # skip benchmarks without kernel info

        work = work_lookup[benchmark]
        oi = oi_lookup[benchmark]

        result[benchmark] = {
            "total_flops": work,
            "peak_achievable_flops": min(peak_flops, oi * mem_speed),
            "timings": {}
        }

        for framework, fw_df in bench_df.groupby("framework"):
            result[benchmark]["timings"][framework] = fw_df["time"].tolist()

    print(result.keys())

    benchmarks = sorted(list(result.keys()))
    generate_grid_plot(
        data=result,
        frameworks=["dace_cpu", "numpy", "numba", "jax", "pythran"],
        benchmarks=benchmarks,
        n_cols=3
    )