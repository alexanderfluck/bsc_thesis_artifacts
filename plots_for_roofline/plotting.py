############## plotting inspired by https://github.com/giopaglia/rooflini

import matplotlib.pyplot as plt

import matplotlib.ticker as ticker

import numpy as np


import argparse
import json
from pathlib import Path
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

    ax.set_xlabel("Operational Intensity [FLOP / Byte]", fontsize=14)
    ax.set_ylabel("Performance [GFLOP/s]", fontsize=14)

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
        f"Theoretical peak: {peak_flops_theoretical:.1f} GFLOP/s",
        ha="right",
        va="bottom",
        fontsize=11,
        color="grey"
    )

    if peak_mem_bw_practical and peak_flops_practical:
        ax.text(
            xmax * 0.95,
            peak_flops_practical * 0.97,
            f"Practical peak: {peak_flops_practical:.1f} GFLOP/s",
            ha="right",
            va="top",
            fontsize=11,
            color="grey"
        )

    # ---------------- styling ----------------
    n_benchmarks = len(benchmarks)

    if not benchmark_colors:
        # Generate evenly spaced hues
        hues = np.linspace(0, 1, len(benchmarks) // 2, endpoint=False)
        colors1 = [mcolors.hsv_to_rgb((h, 0.7, 0.8)) for h in hues]  # bright
        colors2 = [mcolors.hsv_to_rgb((h, 0.7, 0.6)) for h in hues]  # darker
        colors = colors1 + colors2

        benchmark_colors = {bm: colors[i] for i, bm in enumerate(benchmarks)}

    save_color_reference(benchmark_colors, filename+"_colors")

    framework_markers = {
        'cupy': '1',
        'dace_cpu': 'o',
        'dace_gpu': '8',
        'numba': 's',
        'pythran': 'X',
        'triton': 'd',
        'jax': 'v',
        'numpy': '*'
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
            fontsize=11,
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

            ax.scatter(
                oi,
                gflops,
                s=50,
                color=benchmark_colors.get(bm, "#444444"),
                alpha=0.8,
                zorder=10,
                marker=framework_markers[fw]
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
                marker=framework_markers[fw],
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
    fontsize=12,
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
    fontsize=11,
    color="grey",
    rotation_mode="anchor",
)
    if peak_mem_bw_practical and peak_flops_practical:
        y0p = peak_mem_bw_practical * x0
        ax.text(
            x0,
            y0p * 0.7,
            f"Practical Bandwidth: {peak_mem_bw_practical:.1f} GB/s",
            rotation=angle_mem,
            fontsize=11,
            color="grey",
            rotation_mode="anchor",
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

    dace_cpu_framework = DaceFramework("dace_cpu")
    repetitions = args["repeat"]
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

    mem_speed = 256e9
    peak_flops = 6960e9/2
    
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
            
        data_dict[benchmark_name] = {"peak_achievable_flops":min(peak_flops, oi*mem_speed), "total_flops": work, "operational_intensity": oi} 
    
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
    generate_roofline_plot(
    peak_flops_theoretical=3480.0,     # GFLOP/s (theoretical compute peak)
    peak_flops_practical=3000.0,         # GFLOP/s (sustained / practical)
    peak_mem_bw_theoretical=204.0,      # GB/s (theoretical DRAM BW)
    peak_mem_bw_practical=200.0,
    data_dict=data_dict,
    benchmarks=benchmarks,
    frameworks=["dace_cpu", "numpy", "numba"],
    title="CPU Roofline EPYC 7742 (Rome)",
    filename="roofline"
)
