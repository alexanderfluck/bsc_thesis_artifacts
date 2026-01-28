import argparse
import copy
import os
import importlib
import json
from pathlib import Path


import dace
from dace.config import Config
from dace.codegen.instrumentation import papi

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)
import dace.sdfg.performance_evaluation.work_depth as wd
import dace.sdfg.performance_evaluation.total_volume as tv 

import pandas as pd

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.ticker import FuncFormatter



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




# -------------------------------------------------
# Plotting function
# -------------------------------------------------

def generate_grid_plot(
    data: dict,
    n_rows: int,
    n_cols: int,
    frameworks: list,
    benchmarks: list,
    set_ylim: float | None = None,  # interpreted as PERCENT
    draw_all_frameworks:bool = True
):
    fig_width = 2.5 * n_cols
    fig_height = 2.5 * n_rows
    fig, axes = plt.subplots(n_rows, n_cols, figsize=(fig_width, fig_height))

    if n_rows == 1:
        axes = axes.reshape(1, -1)
    elif n_cols == 1:
        axes = axes.reshape(-1, 1)

    axes_flat = axes.flatten()

    framework_colors = {
        'cupy': '#17becf',
        'dace_cpu': '#f7a3ff',
        'dace_gpu': '#9467bd',
        'numba': '#1f77b4',
        'pythran': '#2ca02c',
        'triton': '#ff7f0e',
        'jax': '#d62728',
        'numpy': '#d627aa'
    }
    color_map = {fw: framework_colors.get(fw, "#808080") for fw in frameworks}

    bar_width = 0.6

    percent_formatter = FuncFormatter(lambda y, _: f"{int(y)}%")

    for idx, benchmark in enumerate(benchmarks):
        if idx >= n_rows * n_cols:
            break

        ax = axes_flat[idx]
        bm_data = data[benchmark]

        peak_flops = bm_data["peak_achievable_flops"]
        flops = bm_data["total_flops"]

        means = []
        q1s = []
        q3s = []
        labels = []
        print("\n\n")
        print(bm_data)

        if "timings" not in bm_data:
            ax.axis("off")
            continue

        for fw in frameworks:
            if fw in bm_data["timings"]:
                times = bm_data["timings"][fw]
                values = np.array([(flops / t) / peak_flops for t in times])
                if values.size == 0:
                    if draw_all_frameworks:
                        labels.append(fw)
                        means.append(0)
                        q1s.append(0)
                        q3s.append(0)
                else:
                    means.append(values.mean() * 100.0)
                    q1s.append(np.percentile(values, 25) * 100.0)
                    q3s.append(np.percentile(values, 75) * 100.0)
                    labels.append(fw)

            elif draw_all_frameworks:
                labels.append(fw)
                means.append(0)
                q1s.append(0)
                q3s.append(0)

        x = np.arange(1, len(labels) + 1)

        # --- Bars (mean %) ---
        ax.bar(
            x,
            means,
            width=bar_width,
            color=[color_map[fw] for fw in labels],
            edgecolor=[color_map[fw] for fw in labels],
            linewidth=0.6,
            alpha=0.75,
            zorder=2,
        )

        # --- Q1–Q3 sticks ---
        for xi, q1, q3 in zip(x, q1s, q3s):
            ax.vlines(xi, q1, q3, color="black", linewidth=1.2, zorder=4)
            ax.hlines([q1, q3], xi - 0.08, xi + 0.08,
                      color="black", linewidth=1.2, zorder=4)

        ax.set_title(benchmark, fontsize=11, fontweight="bold")
        ax.set_xticks(x)
        ax.set_xticklabels(labels, fontsize=9)
        ax.tick_params(axis="y", labelsize=9)
        ax.set_ylabel("Achieved % of Roofline", fontsize=8)
        ax.grid(axis="y", alpha=0.3, linestyle="--", linewidth=0.3)

        # --- Y-axis scaling ---
        if set_ylim is None:
            ax.set_ylim(bottom=0)
        else:
            ax.set_ylim(0, set_ylim)

        ax.yaxis.set_major_formatter(percent_formatter)

    for idx in range(len(benchmarks), n_rows * n_cols):
        axes_flat[idx].axis("off")

    fig.suptitle(
        "Achieved Percentage of Roofline",
        fontsize=18,
        fontweight="bold",
        y=0.995,
    )

    # -------------------------------
    # Legend
    # -------------------------------
    legend_elements = [
        plt.Rectangle((0, 0), 1, 1, facecolor=color_map[fw], label=fw)
        for fw in frameworks
    ]

    legend_elements.extend([
        Line2D([0], [0], color="black", linewidth=0, marker="|",
               markersize=12, label="Interquartile range (Q1–Q3)"),
    ])

    legend = fig.legend(
        handles=legend_elements,
        loc="lower center",
        ncol=len(frameworks) + 3,
        fontsize=12,
        bbox_to_anchor=(0.5, 0.02),
        frameon=True,
        fancybox=True,
        shadow=True,
        borderpad=1,
    )
    legend.get_frame().set_linewidth(1.5)
    legend.get_frame().set_edgecolor("gray")

    plt.tight_layout(rect=[0, 0.06, 1, 0.98])
    filename_base = f'benchmark_grid_{n_rows}x{n_cols}_roofline_pct_box'
    plt.savefig(f'{filename_base}.pdf', dpi=300, bbox_inches='tight')
    print(f"Saved {filename_base}.pdf")
    plt.savefig(f'{filename_base}.png', dpi=300, bbox_inches='tight')
    print(f"Saved {filename_base}.png")

# -------------------------------------------------
# Main
# -------------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-p",
                        "--preset",
                        choices=['S', 'M', 'L', 'paper'],
                        nargs="?",
                        default='L')
    parser.add_argument("-b", "--benchmarks", type=str, nargs="+", default=None)
    parser.add_argument("-f", "--floating_point_peak", type=float, nargs="?", default=3480)
    parser.add_argument("-m", "--memory_peak", type=float, nargs="?", default=204)


    args = vars(parser.parse_args())

    dace_cpu_framework = DaceFramework("dace_cpu")
    preset = args["preset"]

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

    


    # Path to bm_ois.json in the same folder as this Python file
    json_path_ois = Path(__file__).parent / "bench_ois.json"
    json_path_works = Path(__file__).parent / "bench_works.json"

    if json_path_ois.exists():
        # Read existing JSON into a dictionary
        with json_path_ois.open("r", encoding="utf-8") as f:
            bench_ois = json.load(f)
    else:
        # Create empty dict and write it to the file
        bench_ois = {}
        with json_path_ois.open("w", encoding="utf-8") as f:
            json.dump(bench_ois, f, indent=4)

    if json_path_works.exists():
        # Read existing JSON into a dictionary
        with json_path_works.open("r", encoding="utf-8") as f:
            bench_works = json.load(f)
    else:
        # Create empty dict and write it to the file
        bench_works = {}
        with json_path_works.open("w", encoding="utf-8") as f:
            json.dump(bench_works, f, indent=4)
        
    data_dict = {}

    mem_speed = args["memory_peak"] * 1e9
    peak_flops = args["floating_point_peak"] * 1e9
    
    for benchmark_name in benchmarks:
        oi = None
        work = None
        if benchmark_name in bench_ois:
            if preset in bench_ois[benchmark_name]:
                print("found old oi")
                oi = bench_ois[benchmark_name][preset]
                work = bench_works[benchmark_name][preset]
                if oi == -1: continue
        if oi is None:
            benchmark = Benchmark(benchmark_name)
            substitutions = benchmark.info["parameters"][preset]
            sdfg, simplified_sdfg = get_bench_sdfg(benchmark, dace_cpu_framework)
            vol_r, vol_w = tv.analyze_sdfg(sdfg)
            work, _ = wd.analyze_sdfg(sdfg, {}, wd.get_tasklet_work_depth, [], False)

            work = work.subs(substitutions)
            total_vol = (vol_r+vol_w).subs(substitutions)

            oi = work/total_vol
            try:
                oi = float(oi)
                work = int(work)
                print(f"{benchmark_name} OI:", oi)
            except:
                print("Could not transform OI", oi, "to an integer")
                oi = -1
                work = -1
            if benchmark_name in bench_ois:
                bench_ois[benchmark_name][preset] = oi
                bench_works[benchmark_name][preset] = work
            else:
                bench_ois[benchmark_name] = {preset: oi}
                bench_works[benchmark_name] = {preset: work}
            
            if oi == -1:
                continue
            
        data_dict[benchmark_name] = {"peak_achievable_flops":min(peak_flops, oi*mem_speed), "total_flops": work} 
    
    with json_path_ois.open("w", encoding="utf-8") as f:
            json.dump(bench_ois, f, indent=4)
    with json_path_works.open("w", encoding="utf-8") as f:
            json.dump(bench_works, f, indent=4)
    
    database = db_path = Path(__file__).parent / "npbench_L_amd_eypc_7742.db"
    
    conn = util.create_connection(database)
    data = pd.read_sql_query("SELECT * FROM results", conn)
    print(data)
    data = data.drop(['timestamp', 'kind', 'dwarf', 'version'],
                    axis=1).reset_index(drop=True)

    data = data[data["domain"] != ""]
    data = data[(data["framework"] != "dace_cpu") |(data["details"] == "auto_opt")]

    data = data[data['preset'] == preset]
    data = data.drop(['preset'], axis=1).reset_index(drop=True)
    for _, row in data.iterrows():
        benchmark = row["benchmark"]
        framework = row["framework"]
        time = row["time"]

        if benchmark not in data_dict:
            continue

        data_dict[benchmark].setdefault("timings", {})
        data_dict[benchmark]["timings"].setdefault(framework, []).append(time)

    for bench, entries in data_dict.items():
        print("===============", bench)
        print(entries)

    benchmarks_with_data = [
    b for b, d in data_dict.items()
    if "timings" in d and any(
        fw in d["timings"] for fw in ["dace_cpu", "numpy", "numba"]
    )
]
    generate_grid_plot(
        data=data_dict,
        n_rows=len(benchmarks_with_data)//4,
        n_cols=4,
        frameworks=["dace_cpu", "numpy", "numba"],
        benchmarks=benchmarks_with_data,
        set_ylim=None,   # or e.g. 60
    )
