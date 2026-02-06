############## plotting inspired by https://github.com/giopaglia/rooflini

import matplotlib.pyplot as plt

import matplotlib.ticker as ticker

import numpy as np


import argparse
import json
import numpy as np
import matplotlib.pyplot as plt

from npbench.infrastructure import (Benchmark, utilities as util, DaceFramework)
import dace.sdfg.performance_evaluation.work_depth as wd
import dace.sdfg.performance_evaluation.total_volume as tv 

import pandas as pd

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
import matplotlib.colors as mcolors
import copy
import os
import seaborn as sns

import importlib
import dace
import sqlite3
import pathlib

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

def save_color_reference(benchmark_colors: dict, filename: str = "benchmark_colors.pdf"):
    """
    Save a separate figure mapping benchmark names to colors.
    """
    n = len(benchmark_colors)
    fig, ax = plt.subplots(figsize=(6, max(6, n * 0.2)))  # adjust height dynamically

    y_pos = list(range(n))
    names = list(benchmark_colors.keys())
    colors = [benchmark_colors[bm] for bm in names]

    # Draw colored rectangles
    for y, name, color in zip(y_pos, names, colors):
        ax.add_patch(plt.Rectangle((0, y - 0.3), 1, 0.6, color=color))
        ax.text(1.05, y, name, va='center', fontsize=10)

    ax.set_xlim(0, 3)
    ax.set_ylim(-1, n)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    plt.close()
    print(f"Saved color reference to {filename}")


def generate_roofline_plot(
    *,
    peak_flops_theoretical: float,     # GFLOP/s
    peak_mem_bw_theoretical: float,     # GB/s
    data_dict: dict,
    benchmarks: list[str],
    frameworks: list[str],
    title: str = "Roofline Plot",
    filename: str = "roofline",
    peak_flops_practical: float = None,        # GFLOP/s
    peak_mem_bw_practical: float = None,     # GB/s
    benchmark_colors = None
):
    # ---------------- Figure & axes ----------------
    xmin = 1e-2

    # Ridge points
    ridge_theoretical = peak_flops_theoretical / peak_mem_bw_theoretical
    if peak_mem_bw_practical and peak_flops_practical:
        ridge_practical   = peak_flops_practical / peak_mem_bw_practical

    # Give ~2 orders of magnitude past the ridge
    xmax = max(ridge_theoretical, ridge_practical) * 100

    ymin = 1e-2

    max_flops = max(peak_flops_theoretical, peak_flops_practical) if peak_flops_practical else peak_flops_theoretical
    ymax = max_flops * 5

    fig, ax = plt.subplots(figsize=(16, 8))
    ax.set_xscale("log")
    ax.set_yscale("log")

    ax.set_xlim(xmin, xmax)
    ax.set_ylim(ymin, ymax)

    ax.set_xlabel("Operational Intensity [FLOP / Byte]", fontsize=16)
    ax.set_ylabel("Performance [GFLOP/s]", fontsize=16)

    # ---------------- Rooflines ----------------


    #   Theoretical memory roof (solid, clipped)
    oi_mem_theoretical = np.logspace(
        np.log10(xmin),
        np.log10(ridge_theoretical),
        256
    )

    perf_mem_theoretical = peak_mem_bw_theoretical * oi_mem_theoretical
    ax.plot(
        oi_mem_theoretical,
        perf_mem_theoretical,
        color="grey",
        linewidth=1.6,
        linestyle="-",
        label="Theoretical memory roof"
    )
    


    #    Practical memory roof (dotted, clipped)
    if peak_mem_bw_practical and peak_flops_practical:
        oi_mem_practical = np.logspace(
            np.log10(xmin),
            np.log10(ridge_practical),
            256
        )

        perf_mem_practical = peak_mem_bw_practical * oi_mem_practical
        ax.plot(
            oi_mem_practical,
            perf_mem_practical,
            color="grey",
            linewidth=1.2,
            linestyle=":",
            label="Practical memory roof"
        )

    #    Theoretical FLOP roof (solid, clipped)
    ax.hlines(
        peak_flops_theoretical,
        ridge_theoretical,
        xmax,
        colors="grey",
        linewidth=1.8,
        linestyles="-",
        label="Theoretical FLOP roof"
    )


    #   Practical FLOP roof (dotted, clipped)
    if peak_mem_bw_practical and peak_flops_practical:
        ax.hlines(
            peak_flops_practical,
            ridge_practical,
            xmax,
            colors="grey",
            linewidth=1.2,
            linestyles=":",
            label="Practical FLOP roof"
        )


    #    Roof annotations
    ax.text(
        xmax * 0.95,
        peak_flops_theoretical * 1.03,
        f"Theoretical peak FLOPs: {peak_flops_theoretical:.1f} GFLOP/s",
        ha="right",
        va="bottom",
        fontsize=14,
        color="grey"
    )

    if peak_mem_bw_practical and peak_flops_practical:
        ax.text(
            xmax * 0.95,
            peak_flops_practical * 0.97,
            f"Practical peak FLOPs: {peak_flops_practical:.1f} GFLOP/s",
            ha="right",
            va="top",
            fontsize=14,
            color="grey"
        )

    # ---------------- styling ----------------

    if not benchmark_colors:
        # Generate evenly spaced hues
        hues = np.linspace(0, 1, len(benchmarks) // 2, endpoint=False)
        colors1 = [mcolors.hsv_to_rgb((h, 0.7, 0.8)) for h in hues]  # bright
        colors2 = [mcolors.hsv_to_rgb((h, 0.7, 0.6)) for h in hues]  # darker
        colors = colors1 + colors2

        benchmark_colors = {bm: colors[i] for i, bm in enumerate(benchmarks)}

    save_color_reference(benchmark_colors, filename+"_colors.pdf")

    framework_markers = {
        'cupy': ('1', 80),
        'dace_cpu': ('o', 80),
        'dace_gpu': ('8', 80),
        'numba': ('s', 80),
        'pythran': ('X',80),
        'triton': ('d', 80),
        'jax': ('v', 80),
        'numpy': ('*', 100)
    }

    # ---------------- Benchmarks ----------------
    for bm in benchmarks:
        if bm not in data_dict:
            continue
        
        bm_data = data_dict[bm]
        
        if "timings" not in bm_data:
            continue 

        oi = bm_data["operational_intensity"]

        # Vertical dotted benchmark line
        ax.axvline(
            oi,
            color="#aaaaaa",
            linewidth=0.6,
            linestyle=(0, (5, 5)),
            zorder=1
        )

        # Benchmark label
        ax.text(
            oi,
            ymin * 1.4,
            bm,
            rotation=90,
            ha="center",
            va="bottom",
            fontsize=14,
            color="#888888"
        )

        total_flops = bm_data["total_flops"]

        # data points
        for fw in frameworks:
            if fw not in bm_data["timings"]:
                continue

            times = bm_data["timings"][fw]
            if not times:
                continue

            t_med = np.median(times)
            gflops = (total_flops / t_med) / 1e9

            print(framework_markers[fw])
            fw_marker = framework_markers[fw][0]
            fw_size = framework_markers[fw][1]
            ax.scatter(
                oi,
                gflops,
                s=fw_size,
                color=benchmark_colors.get(bm, "#444444"),
                alpha=0.8,
                zorder=10,
                marker=fw_marker
            )

    # ---------------- Legend ----------------
    legend_elements = [
        Line2D([0], [0], color="grey", lw=1.8, linestyle="-",
               label="Theoretical roof")
               ]
    if peak_mem_bw_practical and peak_flops_practical:
        legend_elements.append(Line2D([0], [0], color="grey", lw=1.8, linestyle=":",
               label="Practical roof"))
    

    for fw in frameworks:
        legend_elements.append(
            Line2D(
                [0], [0],
                marker=framework_markers[fw][0],
                linestyle="",
                markersize=7,
                color="#444444",
                label=fw
            )
        )

    legend = fig.legend(
    handles=legend_elements,
    loc="lower center",
    ncol=len(frameworks) + 3,
    fontsize=14,
    bbox_to_anchor=(0.5, 0.00),  # move legend BELOW axes
    frameon=True,
    fancybox=True,
    shadow=True,
    borderpad=1,
)

    legend.get_frame().set_linewidth(1.5)
    legend.get_frame().set_edgecolor("gray")

    # Reserve space at the bottom
    plt.title(title, fontsize=18)
    plt.tight_layout(rect=[0, 0.08, 1, 0.95])

    fig.canvas.draw()

    # --- Draw Memory roofline labels at last second so rotation scaling is not messed up
    def angle_of_line(ax, x0, y0, x1, y1):
        p0 = ax.transData.transform((x0, y0))
        p1 = ax.transData.transform((x1, y1))
        dx, dy = p1 - p0
        return np.degrees(np.arctan2(dy, dx))
    x0 = xmin * 1.2
    x1 = xmin * 2.0

    y0 = peak_mem_bw_theoretical * x0
    y1 = peak_mem_bw_theoretical * x1

    angle_mem = angle_of_line(ax, x0, y0, x1, y1)

    ax.text(
    x0,
    y0 * 1.2,
    f"Theoretical Bandwidth: {peak_mem_bw_theoretical:.1f} GB/s",
    rotation=angle_mem,
    fontsize=14,
    color="grey",
    rotation_mode="anchor",
    zorder=15
)
    if peak_mem_bw_practical and peak_flops_practical:
        y0p = peak_mem_bw_practical * x0
        ax.text(
            x0,
            y0p * 0.7,
            f"Practical Bandwidth: {peak_mem_bw_practical:.1f} GB/s",
            rotation=angle_mem,
            fontsize=14,
            color="grey",
            rotation_mode="anchor",
            zorder = 15
        )


    plt.savefig(f"{filename}.pdf", dpi=300, bbox_inches="tight")
    plt.savefig(f"{filename}.png", dpi=300, bbox_inches="tight")
    plt.close()

    print(f"Saved {filename}.pdf and {filename}.png")


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

    peak_flops = args["floating_point_peak"]
    mem_speed = args["memory_peak"]

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
            "operational_intensity": oi,
            "timings": {}
        }

        for framework, fw_df in bench_df.groupby("framework"):
            result[benchmark]["timings"][framework] = fw_df["time"].tolist()

    benchmarks = list(result.keys())
    generate_roofline_plot(
    peak_flops_theoretical=peak_flops,     # GFLOP/s (theoretical compute peak)
    peak_flops_practical=3103.9,         # GFLOP/s (sustained / practical)
    peak_mem_bw_theoretical=mem_speed,      # GB/s (theoretical DRAM BW)
    peak_mem_bw_practical=230.219,
    data_dict=result,
    benchmarks=benchmarks,
    frameworks=["dace_cpu", "numpy", "pythran", "jax", "numba"],
    title="CPU Roofline EPYC 7742 (Rome)",
    filename="roofline_example"
)
