import argparse
import copy
import os
import importlib
import json
from pathlib import Path
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



def generate_grid_plot(data:dict, n_rows, n_cols, frameworks, benchmarks, set_ylim:int|None=None, draw_all_frameworks:bool = False):
    """
    Docstring for generate_grid_plot
    
    :param data: Needs dict of form {"benchmark_name": {
                                                            
                                                        }

    }
    :type data: dict
    :param n_rows: number of grid rows
    :param n_cols: number of grid cols
    :param frameworks: list of frameworks to plot
    :param benchmarks: list of benchmarks to plot
    :param set_ylim: explicitly set the limit on the y-axis (if None, will be automatically scaled)
    :param draw_all_frameworks: Always draw all frameworks from the frameworks list. If one has no data, it is drawn as 0
    """
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
    color_map = {fw: framework_colors.get(fw, '#808080') for fw in frameworks}

    #percent_formatter = FuncFormatter(lambda y, _: f"{int(y)}%")

    for idx, benchmark in enumerate(benchmarks):
        if idx >= n_rows * n_cols:
            break

        ax = axes_flat[idx]
        bm_data = data[benchmark]

        peak_flops = bm_data["peak_achievable_flops"]
        flops = bm_data["total_flops"]

        violin_data = []
        labels = []

        for fw in frameworks:
            if fw in bm_data["timings"]:
                times = bm_data["timings"][fw]
                roofline_pcts = []
                for t in times:
                    achieved = flops / t
                    pct = achieved/peak_flops * 100
                    roofline_pcts.append(pct)

                labels.append(fw)
                violin_data.append(roofline_pcts)
            elif draw_all_frameworks:
                labels.append(fw)
                violin_data.append([0])

        if violin_data:
            parts = ax.violinplot(
            violin_data,
            showmeans=False,
            showmedians=False,
            showextrema=False,
            widths=0.6,
        )

        # Violin bodies
        for body, fw in zip(parts["bodies"], labels):
            body.set_facecolor(color_map.get(fw, "#808080"))
            body.set_edgecolor("black")
            body.set_alpha(0.65)
            body.set_linewidth(0.5)

        # Manual statistics
        for i, values in enumerate(violin_data, start=1):
            values = np.asarray(values)

            median = np.median(values)
            mean = np.mean(values)

            # Median (solid)
            ax.hlines(
                median,
                i - 0.14,
                i + 0.14,
                color="black",
                linewidth=0.6,
                zorder=4,
            )

            # Mean (dashed)
            ax.hlines(
                mean,
                i - 0.14,
                i + 0.14,
                color="black",
                linewidth=0.6,
                linestyles="--",
                zorder=4,
            )

            q1, q3 = np.percentile(values, [25, 75])

            ax.hlines(
                q1,
                i - 0.05,
                i + 0.05,
                color="black",
                linewidth=0.6,
                zorder=4,
            )
            ax.hlines(
                q3,
                i - 0.05,
                i + 0.05,
                color="black",
                linewidth=0.6,
                zorder=4,
            )

            ax.vlines(i, q1, q3, color="black", linewidth=0.5, zorder=4)
        
        if set_ylim:
            ax.set_ylim(0.0, set_ylim)
        else:
            ax.set_ylim(bottom=0.0)

        ax.set_title(benchmark, fontsize=9, fontweight='bold')
        ax.set_xticks(range(1, len(labels)+1))
        ax.set_xticklabels(labels, fontsize=7, rotation=0)
        ax.tick_params(axis='y', labelsize=7)
        ax.set_ylabel('Percentage of Roofline', fontsize=6)
        ax.grid(axis='y', alpha=0.3, linestyle='--', linewidth=0.3)
        #ax.yaxis.set_major_formatter(percent_formatter)


    for idx in range(len(benchmarks), n_rows * n_cols):
        axes_flat[idx].axis('off')

    fig.suptitle('Achieved Percentage of Roofline', fontsize=16, fontweight='bold', y=0.995)

    legend_elements = [plt.Rectangle((0,0),1,1, facecolor=color_map[fw], label=fw) for fw in frameworks]
    
    legend_elements.extend([
    Line2D([0], [0], color="black", linewidth=1.0, label="Median"),
    Line2D([0], [0], color="black", linewidth=0.6, linestyle="--", label="Mean"),
    Line2D([0], [0], color="black", linewidth=0, marker="|",
           markersize=12, label="Interquartile range (Q1–Q3)"),
])

    legend = fig.legend(
        handles=legend_elements,
        loc="upper center",
        ncol=len(frameworks) + 3,
        fontsize=11,
        bbox_to_anchor=(0.5, -0.02),
        frameon=True,
        fancybox=True,
        shadow=True,
        borderpad=1
    )
    legend.get_frame().set_linewidth(1.5)
    legend.get_frame().set_edgecolor('gray')

    plt.tight_layout(rect=[0, 0.04, 1, 0.98])

    filename_base = f'benchmark_grid_{n_rows}x{n_cols}_roofline_pct_violin'
    plt.savefig(f'{filename_base}.pdf', dpi=300, bbox_inches='tight')
    print(f"Saved {filename_base}.pdf")
    plt.savefig(f'{filename_base}.png', dpi=300, bbox_inches='tight')
    print(f"Saved {filename_base}.png")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-p",
                        "--preset",
                        choices=['S', 'M', 'L', 'paper'],
                        nargs="?",
                        default='L')
    parser.add_argument("-r", "--repeat", type=int, nargs="?", default=10)
    parser.add_argument("-b", "--benchmarks", type=str, nargs="+", default=None)
    parser.add_argument("-m", "--mem_roofline", type=float, nargs="?", default=204.8)
    parser.add_argument("-c", "--cpu_roofline", type=float, nargs="?", default=3480)
    parser.add_argument("-d", "--database", type=str, nargs="?", default=Path(__file__).parent / "npbench_L_amd_eypc_7742.db")

    args = vars(parser.parse_args())

    dace_cpu_framework = DaceFramework("dace_cpu")
    repetitions = args["repeat"]
    preset = args["preset"]
    mem_speed = args["mem_roofline"] * 1e9
    peak_flops = args["cpu_roofline"] * 1e9
    database = args["database"]

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
            
            if oi == -1: continue
        
        print("======================================================================================================", oi*mem_speed)
        data_dict[benchmark_name] = {"peak_achievable_flops":min(peak_flops, oi*mem_speed), "total_flops": work} 
        print(data_dict)
    
    with json_path_ois.open("w", encoding="utf-8") as f:
            json.dump(bench_ois, f, indent=4)
    with json_path_works.open("w", encoding="utf-8") as f:
            json.dump(bench_works, f, indent=4)
    
    
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
    )