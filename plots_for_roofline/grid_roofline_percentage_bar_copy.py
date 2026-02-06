import argparse
import copy
import os
import importlib
import json
import pathlib
import pandas as pd


import dace
from dace.config import Config
from dace.codegen.instrumentation import papi

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)
import dace.sdfg.performance_evaluation.work_depth as wd
import dace.sdfg.performance_evaluation.total_volume as tv 

import pandas as pd
import sqlite3
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.ticker import FuncFormatter

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
    fig_width = 3.2 * n_cols
    fig_height = 3.2 * n_rows
    fig, axes = plt.subplots(n_rows, n_cols, figsize=(fig_width, fig_height), constrained_layout=True)

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

        ax.set_title(benchmark, fontsize=13, fontweight="bold")
        ax.set_xticks(x)
        ax.set_xticklabels(labels, fontsize=11, rotation=90)
        ax.tick_params(axis="y", labelsize=11)
        ax.set_ylabel("Achieved % of Roofline", fontsize=13)
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
               markersize=14, label="Interquartile range (Q1–Q3)"),
    ])

    legend = fig.legend(
    handles=legend_elements,
    loc="lower center",
    ncol=len(frameworks) + 3,
    bbox_to_anchor=(0.5, -0.02),
    fontsize=14,
    frameon=True,
    fancybox=True,
    shadow=True,
)
    fig.set_constrained_layout_pads(h_pad=0.08)

    legend.get_frame().set_linewidth(1.5)
    legend.get_frame().set_edgecolor("gray")

    filename_base = f'benchmark_grid_{n_rows}x{n_cols}_roofline_pct_box'
    plt.savefig(f'{filename_base}.pdf', dpi=300)
    print(f"Saved {filename_base}.pdf")
    plt.savefig(f'{filename_base}.png', dpi=300)
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
    parser.add_argument("-f", "--floating_point_peak", type=float, nargs="?", default=4608)
    parser.add_argument("-m", "--memory_peak", type=float, nargs="?", default=409.6)
    parser.add_argument("-d", "--database", type=str, nargs="+", default="/home/alex/Studium/bachelor_thesis/artifacts_repo/bsc_thesis_artifacts/plots_for_roofline/npbench_L_amd_eypc_7742.db")


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
    print(symbolic_data)
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
            ((time_table["framework"] == "dace_cpu") & (time_table["details"] != "auto_opt"))
        )
    ].copy()

    # --- Build the final dictionary ---
    result = {}

    for benchmark, bench_df in filtered_time_table.groupby("benchmark"):
        if benchmark not in work_lookup:
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

    benchmarks = list(result.keys())
    generate_grid_plot(
        data=result,
        n_rows=len(benchmarks)//4,
        n_cols=4,
        frameworks=["dace_cpu", "numpy", "numba", "jax", "pythran"],
        benchmarks=benchmarks,
        set_ylim=None,   # or e.g. 60
    )
