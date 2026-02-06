import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from io import StringIO

# Load the data
df = pd.read_csv("/home/alex/Studium/bachelor_thesis/artifacts_repo/bsc_thesis_artifacts/correlation_and_fit/correlation_results/fit_analysis/fit_summary.csv")

df = df[df['measured_metric'] != 'PAPI FLOPs']
# Map long metric names to clean labels
label_map = {
    'symbolic_volume_read_bytes': 'Static Read Vol.',
    'symbolic_volume_write_bytes': 'Static Write Vol.',
    'Symbolic Bytes': 'Static Total Vol.'
}
df['symbolic_metric'] = df['symbolic_metric'].map(label_map)

# Define the logical order
custom_order = ['Static Read Vol.', 'Static Write Vol.', 'Static Total Vol.']

# Pivot the tables
r2_pivot = df.pivot(index="symbolic_metric", columns="measured_metric", values="R2")
rmae_pivot = df.pivot(index="symbolic_metric", columns="measured_metric", values="RMAE")

# REORDER rows according to custom_order
r2_pivot = r2_pivot.reindex(custom_order)
rmae_pivot = rmae_pivot.reindex(custom_order)


# 3. PLOTTING CONFIGURATION
sns.set_theme(style="white") 

# SHRINK the figsize. This makes the text "larger" relative to the heatmap cells.
# A 7x6 or 8x7 size is much better for a thesis column.
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 7), sharex=True)

# Heatmap parameters
heatmap_kwargs = {
    "annot": True, 
    "fmt": ".2f", 
    "linewidths": 1, 
    "linecolor": 'white',
    "annot_kws": {"size": 12}, # Cell numbers
    "square": False,
    "cbar_kws": {"shrink": 0.8} # Prevents colorbar from towering over the plot
}

# --- Top Plot: R2 ---
sns.heatmap(r2_pivot, cmap="RdBu", center=0, ax=ax1, **heatmap_kwargs)

ax1.set_title("Prediction Accuracy: $R^2$ Score", fontsize=16, pad=12, )
ax1.set_ylabel("SDFG Metric", fontsize=14)
# Increase colorbar label size
ax1.collections[0].colorbar.set_label('$R^2$ Score', fontsize=12, )

# --- Bottom Plot: RMAE ---
sns.heatmap(rmae_pivot, cmap="YlOrBr", ax=ax2, **heatmap_kwargs)

ax2.set_title("Prediction Error: RMAE", fontsize=16, pad=12, )
ax2.set_ylabel("SDFG Metric", fontsize=14, )
ax2.set_xlabel("PAPI Hardware Metric Formula", fontsize=14, )
# Increase colorbar label size
ax2.collections[0].colorbar.set_label('RMAE Factor', fontsize=12, )

# 4. FINAL ADJUSTMENTS
# Tick labels (The names of the metrics on the side/bottom)
plt.setp(ax1.get_yticklabels(), fontsize=11)
plt.setp(ax2.get_yticklabels(), fontsize=11)
plt.xticks(rotation=90, ha='right', fontsize=11) # 45 deg is often more readable than 90

plt.tight_layout()

# Save for LaTeX - PDF is best for thesis quality!
plt.savefig("memory_evaluation_plot.pdf", bbox_inches='tight')
plt.savefig("memory_evaluation_plot.png", dpi=300, bbox_inches='tight')
plt.show()