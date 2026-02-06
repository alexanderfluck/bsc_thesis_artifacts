import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

# -----------------------
# Configuration
# -----------------------
INPUT_CSV = "results.csv"   # change if needed
OUTPUT_DIR = Path("correlation_results")

OUTPUT_DIR.mkdir(exist_ok=True)
sdfgs_with_no_lib_nodes = ['adi', 'arc_distance', 'cavity_flow', 'cholesky2', 'compute', 'conv2d_bias', 'crc16', 'deriche', 'fdtd_2d', 'floyd_warshall', 'go_fast', 'hdiff', 'heat_3d', 'jacobi_1d', 'jacobi_2d', 'nussinov', 'resnet', 'seidel_2d',  'syr2k', 'syrk', 'vadv']
sdfgs_with_lib_nodes = ['azimint_hist', 'azimint_naive',  'channel_flow', 'softmax', 'atax', 'bicg', 'cholesky', 'contour_integral', 'correlation', 'covariance', 'durbin', 'gemm', 'gemver', 'gesummv', 'gramschmidt', 'k2mm', 'k3mm', 'lenet', 'ludcmp', 'lu', 'mlp', 'mvt', 'nbody', 'scattering_self_energies', 'spmv', 'symm', 'trisolv', 'trmm']
sdfgs_sim = ['nussinov', 'jacobi_1d', 'arc_distance', 'floyd_warshall', 'go_fast', 'gesummv']
sdfgs_high_roof_pct = ['atax', 'compute', 'covariance', 'fdtd_2d', 'gemver', 'gesummv', 'go_fast', 'hdiff', 'heat_3d', 'jacobi_2d']
sdfgs_bad_roofline_pct = ['adi', #'azimint_hist', no data
                          'durbin', #'gemm', no data
                            'gramschmidt', #'k2mm', 'k3mm', no data
                              'ludcmp', # 'mlp',
                                'resnet', 'seidel_2d', #'softmax', no data
                                  'symm', 'syr2k', 'syrk', 'trisolv']
bad_data = ['azimint_hist', 'azimint_naive', 'cholesky', 'compute', 'crc16', 'gemm', 'gesummv', 'k2mm', 'k3mm', 'mandelbrot1', 'mandelbrot2']
# -----------------------
# Load data
# -----------------------
df = pd.read_csv(INPUT_CSV)
df = pd.read_csv(INPUT_CSV)
df.columns = df.columns.str.strip()
df = df[df["benchmark"].isin(sdfgs_high_roof_pct)]


df = df.drop('L3 DMisses', axis=1)
df = df.drop('L2 DMisses', axis=1)
print(df.columns)
# -----------------------
# Identify columns
# -----------------------
symbolic_cols = [
    "Symbolic Bytes",
    "symbolic_volume_write_bytes",
    "symbolic_volume_read_bytes",
]

exclude_cols = (
    ["benchmark", "work"]
    + symbolic_cols
)

measured_cols = [
    c for c in df.columns
    if c not in exclude_cols
    and pd.api.types.is_numeric_dtype(df[c])
]

# -----------------------
# Correlation analysis
# -----------------------
results = []

def safe_log(x):
    return np.log10(x.replace(0, np.nan))

for sym in symbolic_cols:
    for meas in measured_cols:
        x = df[sym]
        y = df[meas]

        if x.isna().all() or y.isna().all():
            continue

        entry = {
            "symbolic_metric": sym,
            "measured_metric": meas,
            "pearson": x.corr(y, method="pearson"),
            "spearman": x.corr(y, method="spearman"),
            "kendall": x.corr(y, method="kendall"),
            "pearson_loglog": safe_log(x).corr(safe_log(y), method="pearson"),
        }
        results.append(entry)

corr_df = pd.DataFrame(results)
corr_df.to_csv(OUTPUT_DIR / "correlation_summary.csv", index=False)

# -----------------------
# Plotting
# -----------------------
for sym in symbolic_cols:
    top = (
        corr_df[corr_df["symbolic_metric"] == sym]
        .sort_values("pearson_loglog", ascending=False)
        .head(6)
    )

    for _, row in top.iterrows():
        meas = row["measured_metric"]

        plt.figure(figsize=(5, 4))
        plt.scatter(
            safe_log(df[sym]),
            safe_log(df[meas]),
            alpha=0.7
        )
        plt.xlabel(f"log10({sym})")
        plt.ylabel(f"log10({meas})")
        plt.title(
            f"{sym} vs {meas}\n"
            f"Pearson(log) = {row['pearson_loglog']:.3f}"
        )
        plt.grid(True)

        fname = (
            OUTPUT_DIR
            / (f"{sym}_VS_{meas}".replace(" ", "_")
            + ".png")
        )
        plt.tight_layout()
        plt.savefig(fname)
        plt.close()

# -----------------------
# High-level overview table
# -----------------------
overview = (
    corr_df
    .groupby("symbolic_metric")[[
        "pearson",
        "spearman",
        "kendall",
        "pearson_loglog"
    ]]
    .mean()
    .reset_index()
)

overview.to_csv(OUTPUT_DIR / "correlation_overview_high_roof.csv", index=False)

# -----------------------
# Fit / prediction quality analysis
# -----------------------

fit_results = []

FIT_DIR = OUTPUT_DIR / "fit_analysis"
FIT_DIR.mkdir(exist_ok=True)

for sym in symbolic_cols:
    for meas in measured_cols:
        S = df[sym]
        M = df[meas]

        mask = (~S.isna()) & (~M.isna())
        S = S[mask]
        M = M[mask]

        if len(S) < 2:
            continue

        # Absolute and relative errors
        abs_err = (M - S).abs()
        rel_err = abs_err / M.replace(0, np.nan)

        # Metrics
        rmse = np.sqrt(np.mean((M - S) ** 2))
        rmae = np.nanmean(rel_err)

        # R^2 without fitting
        ss_res = np.sum((M - S) ** 2)
        ss_tot = np.sum((M - M.mean()) ** 2)
        r2 = 1 - ss_res / ss_tot if ss_tot != 0 else np.nan

        fit_results.append({
            "symbolic_metric": sym,
            "measured_metric": meas,
            "RMSE": rmse,
            "RMAE": rmae,
            "R2": r2,
        })

        # -----------------------
        # Per-benchmark error plot
        # -----------------------
        plt.figure(figsize=(7, 4))
        plt.bar(df.loc[mask, "benchmark"], abs_err)
        plt.xticks(rotation=90)
        plt.ylabel("Absolute Error (Bytes)")
        plt.title(f"|Measured - Symbolic|\n{sym} vs {meas}")
        plt.grid(axis="y", alpha=0.3)
        plt.tight_layout()

        fname = (
            FIT_DIR
            / (f"ABS_ERROR_{sym}_VS_{meas}".replace(" ", "_") + ".png")
        )
        plt.savefig(fname)
        plt.close()

fit_df = pd.DataFrame(fit_results)
fit_df.to_csv(FIT_DIR / "fit_summary.csv", index=False)

# High-level overview per symbolic metric
fit_overview = (
    fit_df
    .groupby("symbolic_metric")[["RMSE", "RMAE", "R2"]]
    .mean()
    .reset_index()
)

fit_overview.to_csv(FIT_DIR / "fit_overview_high_roof_pct.csv", index=False)


print("Analysis complete.")
print(f"Results saved in: {OUTPUT_DIR.resolve()}")
print(f"Fit results saved in", FIT_DIR / "fit_overview.csv")