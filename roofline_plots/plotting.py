############## plotting inspired by https://github.com/giopaglia/rooflini

import matplotlib.pyplot as plt

import matplotlib.ticker as ticker

import matplotlib.cm as cm

import numpy as np


##########################################################
# set_size for explicitly setting axes widths/heights
# see: https://stackoverflow.com/a/44971177/5646732

def set_size(w,h, ax=None):
    """ w, h: width, height in inches """
    if not ax: ax=plt.gca()
    l = ax.figure.subplotpars.left
    r = ax.figure.subplotpars.right
    t = ax.figure.subplotpars.top
    b = ax.figure.subplotpars.bottom
    figw = float(w)/(r-l)
    figh = float(h)/(t-b)
    ax.figure.set_size_inches(figw, figh)

def generate_roofline_plot( peak_gflops: float, 
                            peak_mem_bandwidth_t:float,
                            peak_mem_bandwidth_p: float,
                            points:list[dict],  # provide a list of datapoint dicts, 
                                                # where the data point dict is structured as follows: 
                                                # {'name': 'my bm name', 'OI': 10.00, 'GFLOPs' : 20.00, 'label': 'my bm label'}
                            title:str = "Roofline Plot", filename:str = "roofline.png"
                            ):
    # Axis limits
    xmin, xmax, ymin, ymax = 0.01, 20, 0.01, peak_gflops/0.8
    #Figure
    fig_ratio = 2
    fig_dimension = 7
    fig = plt.figure()
    ax = plt.subplot(1,1,1)
    ax.grid(color="#dddddd", zorder=-1)
    ax.set_xlabel("Arithmetic Intensity [FLOP/Byte]", fontsize=15)
    ax.set_ylabel("Performance [GFLOP/s]", fontsize=15)

    xlogsize = float(np.log10(xmax/xmin))
    ylogsize = float(np.log10(ymax/ymin))
    m = xlogsize/ylogsize

    cpu_roofs = [
    {"name": "DP FLOP peak", "val": peak_gflops}
    ]

    mem_bottlenecks = [
    {"name" : "Practical Memory Bandwidth", "val" : peak_mem_bandwidth_p},
    ]
    if peak_mem_bandwidth_t >0:
        mem_bottlenecks.append({"name" : "Theoretical Memory Bandwidth", "val" : peak_mem_bandwidth_t})

    # START
    max_roof  = cpu_roofs[0]["val"]
    max_slope = mem_bottlenecks[0]["val"]

    # Find maximum roof
    for roof in cpu_roofs:
        if roof["val"] > max_roof:
            max_roof = roof["val"]

        # Draw slopes (memory bandwidth lines)
    for slope in mem_bottlenecks:
        bw = slope["val"]
        print("slope\t\"" + slope["name"] + "\"\t\t" + str(bw) + " GB/s")

        # ---- FIX: clip line to plot box (no zero, no fake origin) ----
        x_start = max(xmin, ymin / bw)
        y_start = bw * x_start

        x_end = min(xmax, max_roof / bw)
        y_end = bw * x_end
        # --------------------------------------------------------------

        ax.loglog(
            [x_start, x_end],
            [y_start, y_end],
            linewidth=1.0,
            linestyle='-.',
            marker="2",
            color="grey",
            zorder=10
        )

        # Label (placed slightly above the start of the line)
        xpos = x_start * 1.2
        ypos = bw * xpos

        ax.annotate(
            slope["name"] + ": " + str(bw) + " GB/s",
            (xpos, ypos),
            rotation=np.arctan(m / fig_ratio) * 180 / np.pi,
            rotation_mode='anchor',
            fontsize=11,
            ha="left",
            va='bottom',
            color="grey"
        )

        # Track maximum slope
        if bw > max_slope:
            max_slope = bw


    # Draw roofs
    for roof in cpu_roofs:
        print("roof\t\"" + roof["name"] + "\"\t\t" + str(roof["val"]) + " GFLOP/s")

        x = [roof["val"]/max_slope, xmax*10]
        ax.loglog(x, [roof["val"] for xx in x], linewidth=1.0,
            linestyle='-.',
            marker="2",
            color="grey",
            zorder=10)

        # Label
        ax.text(
            xmax/(10**(xlogsize*0.01)), roof["val"]*(10**(ylogsize*0.01)),
            roof["name"] + ": " + str(roof["val"]) + " GFLOPs",
            ha="right",
            fontsize=11,
            color="grey")

    colormap = plt.cm.tab20
    num_colors = 20  # You can adjust this depending on how many colors you need

    # Cycle through the colors from the colormap
    colors = [colormap(i / num_colors) for i in range(num_colors)]

    # Example: Assign a color to each point (you can define your own logic for this)
    point_colors = [colors[i % num_colors] for i in range(len(points))]

    for i, data_point in enumerate(points):
        oi = data_point['OI']

        #draw dotted vertical line through data point
        plt.axvline(x=oi, dashes=[10, 10, 3, 10], linewidth=0.3, color="#aaaaaa")

        ax.text(
            oi/1.15, ymin*1.24,
            data_point['name'],
            fontsize=12,
            rotation=90,
            va="bottom",
            color="#888888")
        
        # Draw data point 
        ax.scatter(oi, data_point["GFLOPs"], c=point_colors[i], label=data_point["label"], alpha=.7, zorder=100)

    # Logarithmic axis labels format
    #ax.yaxis.set_major_formatter(ticker.FuncFormatter(lambda y,pos: ('{{:.{:1d}f}}'.format(int(np.maximum(-np.log10(y),0)))).format(y)))
    ax.xaxis.set_major_formatter(ticker.FuncFormatter(lambda y,pos: ('{{:.{:1d}f}}'.format(int(np.maximum(-np.log10(y),0)))).format(y)))

    
    ax.set_xlim(xmin, xmax)
    ax.set_ylim(ymin, ymax)

    plt.figlegend()
    plt.title(title, fontsize=20)
    plt.tight_layout()
    set_size(fig_dimension*fig_ratio,fig_dimension)
    plt.savefig(filename)

    print(f"Created roofline plot at {filename}")