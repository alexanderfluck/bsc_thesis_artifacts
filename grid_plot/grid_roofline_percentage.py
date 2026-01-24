import argparse
import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from scipy.stats.mstats import gmean
from npbench.infrastructure import utilities as util

parser = argparse.ArgumentParser()
parser.add_argument("-r", "--rows", type=int, default=6, help="Number of rows in the grid")
parser.add_argument("-c", "--cols", type=int, default=9, help="Number of columns in the grid")
args = parser.parse_args()

def generate_grid_plot(data:dict, n_rows, n_cols, frameworks, benchmarks, set_ylim:int|None=None):
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
        'dace_cpu': '#1f77b4',
        'dace_gpu': '#9467bd',
        'numba': '#1f77b4',
        'pythran': '#2ca02c',
        'triton': '#ff7f0e',
        'jax': '#d62728',
    }
    color_map = {fw: framework_colors.get(fw, '#808080') for fw in frameworks}

    for idx, benchmark in enumerate(benchmarks):
        if idx >= n_rows * n_cols:
            break

        row = idx // n_cols
        ax = axes_flat[idx]
        bm_data = data[benchmark]

        peak_flops = bm_data["peak_achievable_flops"]
        flops = bm_data["total_flops"]

        violin_data = []
        labels = []

        if set_ylim:
            ax.set_ylim(0.0, set_ylim)
        for fw, times in bm_data["timings"].items():
            if not fw in frameworks:
                continue
            
            roofline_pcts = []
            for t in times:
                achieved = flops / t
                pct = achieved/peak_flops
                roofline_pcts.append(pct)

            if roofline_pcts:
                labels.append(fw)
                violin_data.append(roofline_pcts)

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


        
        ax.set_title(benchmark, fontsize=9, fontweight='bold')
        ax.set_xticks(range(1, len(labels)+1))
        ax.set_xticklabels(labels, fontsize=7, rotation=0)
        ax.tick_params(axis='y', labelsize=7)
        ax.set_ylabel('Percentage of Roofline', fontsize=6)
        ax.grid(axis='y', alpha=0.3, linestyle='--', linewidth=0.3)

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

    filename_base = f'benchmark_grid_{n_rows}x{n_cols}'
    plt.savefig(f'{filename_base}.pdf', dpi=300, bbox_inches='tight')
    print(f"Saved {filename_base}.pdf")
    plt.savefig(f'{filename_base}.png', dpi=300, bbox_inches='tight')
    print(f"Saved {filename_base}.png")

def get_data(benchmarks):
    database = r"npbench.db"
    conn = util.create_connection(database)
    data = pd.read_sql_query("SELECT * FROM results", conn)

    data = data.drop(['timestamp', 'kind', 'dwarf', 'version'],
                    axis=1).reset_index(drop=True)

    data = data[data["domain"] != ""]

    data = data[data['preset'] == 'paper']
    data = data.drop(['preset'], axis=1).reset_index(drop=True)

    aggdata = data.groupby(["benchmark", "domain", "framework", "mode", "details"],
                        dropna=False).agg({
                            "time": "median",
                            "validated": "first"
                        }).reset_index()
    best = aggdata.sort_values("time").groupby(
        ["benchmark", "domain", "framework", "mode"],
        dropna=False).first().reset_index()
    bestgroup = best.drop(["time", "validated"], axis=1)
    data = pd.merge(left=bestgroup,
                    right=data,
                    on=["benchmark", "domain", "framework", "mode", "details"],
                    how="inner")
    data = data.drop(['mode', 'details'], axis=1).reset_index(drop=True)

if __name__ == "__main__":
    generate_grid_plot(data, 1, 4, ["numpy", "triton", "jax"], ["matmul", "matmul2", "matmul3","stencil"], 0.03)