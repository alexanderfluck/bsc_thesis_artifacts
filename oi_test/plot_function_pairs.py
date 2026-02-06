import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sympy as sp
from io import StringIO

# ============================================================
# CSV DATA
# ============================================================
import pandas as pd

# Load the two files
df1 = pd.read_csv('volumes_per_preset_2.csv')
df2 = pd.read_csv('volumes_per_preset_3.csv')

# Stack them vertically (append df2 to the end of df1)
# ignore_index=True ensures the row numbers go from 0 to N smoothly
df = pd.concat([df1, df2], ignore_index=True)

df = df[df["line_size"] == 64]

# Display the combined data
print(df)

papi_points = {
    "nussinov":{'L': (('AMD L2', 200 ,11683.5*64), ('Intel L3', 200, 6873.5*64))},
    "arc_distance": {'L': (('AMD L2', 10000000, 4842954*64), ('Intel L3', 10000000, 43095145.5*64))},
    "floyd_warshall": {'L': (('AMD L2', 850, 54800238.5*64), ('Intel L3', 850, 57926377*64))},
    "go_fast": {'L': (('AMD L2', 20000, 38248346.5*64), ('Intel L3', 20000, 91062265*64))},
    "jacobi_1d":{'L': (('AMD L2', 8500, 322934610*64), ('Intel L3', 8500, 131247613*64))},
    "gesummv":{'L': (('AMD L2', 14000, 23059480.5*64), ('Intel L3', 14000, 129320675*64))}
}

def make_callable(expr_str):
    N, k, TSTEPS = sp.symbols("N k TSTEPS")
    expr = sp.sympify(expr_str, locals={"N": N, "k": k, "TSTEPS": TSTEPS, "Sum": sp.Sum, "Max": sp.Max, "log": sp.log})
    return sp.lambdify(N, expr.subs(TSTEPS, 5).doit(), modules="math")

# ============================================================
# PLOTTING
# ============================================================
N_vals = np.geomspace(2, 100000000, num=60).astype(int)
N_vals = np.unique(N_vals)

midpoint = len(df) // 2
df_list = [df.iloc[:midpoint], df.iloc[midpoint:]]
fig, axes = plt.subplots(2, 1, figsize=(14, 12), sharex=True)
cmap = plt.get_cmap('tab10')

Y_MIN_LIMIT = 10  # Define a baseline to prevent log-clipping

for i, sub_df in enumerate(df_list):
    ax = axes[i]
    for idx, (_, row) in enumerate(sub_df.iterrows()):
        color_idx = (i * midpoint + idx) % 10
        color = cmap(color_idx)
        
        v_fn_raw = make_callable(row["Volume_total_tv"])
        f_fn_raw = make_callable(row["OI_fitted_func"])

        # Clip values to Y_MIN_LIMIT so they stay visible on the plot
        y_vol = [max(Y_MIN_LIMIT, float(v_fn_raw(int(n)))) for n in N_vals]
        y_fit = [max(Y_MIN_LIMIT, float(f_fn_raw(int(n)))) for n in N_vals]

        ax.plot(N_vals, y_vol, color=color, linestyle="-", alpha=0.6, label=f"{row['kernel']} Static")
        ax.plot(N_vals, y_fit, color=color, linestyle=":", linewidth=2, label=f"{row['kernel']} Simulated")

        if row['kernel'] in papi_points:
            measurements = papi_points[row['kernel']]['L']
            for name, n_val, val in measurements:
                marker = 's' if 'AMD' in name else '^'
                ax.scatter(n_val, val, color=color, marker=marker, s=120, 
                           edgecolors='black', linewidths=1.5, zorder=5, 
                           label=f"{row['kernel']} {name} misses*64")

    ax.set_xscale('log')
    ax.set_yscale('log')
    ax.set_ylim(bottom=Y_MIN_LIMIT) # Ensure the plot starts at our limit
    ax.set_xlim(left=4, right=1e8)
    ax.set_ylabel("Bytes", fontsize=15)
    ax.grid(True, which="both", ls="--", alpha=0.4)
    ax.legend(bbox_to_anchor=(1.05, 1), loc='upper left', fontsize=13)
    ax.set_title(f"Memory Traffic Analysis (Group {i+1})")

axes[1].set_xlabel("Problem Size N", fontsize = 15)
plt.tight_layout()
plt.savefig("volume_comparison.png")
plt.show()