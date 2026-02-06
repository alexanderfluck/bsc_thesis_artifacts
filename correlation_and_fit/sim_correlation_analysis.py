import pandas as pd
import numpy as np
import sympy as sp
from scipy.stats import spearmanr, pearsonr, kendalltau
from pathlib import Path

# --- Configuration ---
RESULTS_CSV = "results.csv"  
OUTPUT_DIR = Path("simulated_analysis_results")
OUTPUT_DIR.mkdir(exist_ok=True)

# 1. Load Simulated Functions
df_vol2 = pd.read_csv('volumes_per_preset_2.csv')
df_vol3 = pd.read_csv('volumes_per_preset_3.csv')
df_sim = pd.concat([df_vol2, df_vol3], ignore_index=True)
df_sim = df_sim[df_sim["line_size"] == 64]

# 2. Measurement Dictionary (N values)
papi_points = {
    "nussinov": 200,
    "arc_distance": 10000000,
    "floyd_warshall": 850,
    "go_fast": 20000,
    "jacobi_1d": 8500,
    "gesummv": 14000
}

def make_callable(expr_str):
    N, k, TSTEPS = sp.symbols("N k TSTEPS")
    expr = sp.sympify(expr_str, locals={"N": N, "k": k, "TSTEPS": TSTEPS, "Sum": sp.Sum, "Max": sp.Max, "log": sp.log})
    return sp.lambdify(N, expr.subs(TSTEPS, 5).doit(), modules="math")

def safe_log(x):
    return np.log10(x.replace(0, np.nan))

# 3. Evaluate Simulated Functions at PAPI N-values
sim_evals = []
for _, row in df_sim.iterrows():
    bench = row['kernel']
    if bench in papi_points:
        n_val = papi_points[bench]
        try:
            fn = make_callable(row["OI_fitted_func"])
            prediction = float(fn(int(n_val)))
            sim_evals.append({
                "benchmark": bench,
                "Simulated Pred Volume": max(1.0, prediction) 
            })
        except Exception as e:
            print(f"Error evaluating {bench}: {e}")

df_sim_preds = pd.DataFrame(sim_evals)

# 4. Load Results and Merge
df_meas = pd.read_csv(RESULTS_CSV)
df_merged = pd.merge(df_meas, df_sim_preds, on="benchmark")

# 5. Correlation Analysis (SIMULATED ONLY)
# We use "Simulated Pred Volume" as our symbolic_metric
measured_cols = [c for c in df_meas.columns if c not in ["benchmark", "work"] and pd.api.types.is_numeric_dtype(df_meas[c])]
results = []

for m_col in measured_cols:
    x = df_merged["Simulated Pred Volume"]
    y = df_merged[m_col]

    # Clean NaNs
    mask = (~x.isna()) & (~y.isna())
    x_m, y_m = x[mask], y[mask]

    if len(x_m) < 2: continue

    # Calculate metrics to match your specific table structure
    pearson_val = x_m.corr(y_m, method="pearson")
    spearman_val = x_m.corr(y_m, method="spearman")
    kendall_val = x_m.corr(y_m, method="kendall")
    
    # Pearson on log-log space
    log_x = np.log10(x_m)
    log_y = np.log10(y_m.replace(0, 1e-9)) # Avoid log(0)
    pearson_loglog = log_x.corr(log_y, method="pearson")

    results.append({
        "symbolic_metric": "Simulated Pred Volume",
        "measured_metric": m_col,
        "pearson": pearson_val,
        "spearman": spearman_val,
        "kendall": kendall_val,
        "pearson_loglog": pearson_loglog
    })

# 6. Save in exact structure
sim_corr_df = pd.DataFrame(results)
sim_corr_df.to_csv(OUTPUT_DIR / "simulated_correlation_summary.csv", index=False)

print("\n=== SIMULATED CORRELATION RESULTS (MATCHED STRUCTURE) ===")
print(sim_corr_df.to_string(index=False))