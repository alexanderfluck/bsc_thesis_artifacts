import dace
from math import sin
import random
from dace.codegen.instrumentation import papi
import numpy as np
import dace.transformation.auto.auto_optimize as opt


@dace.program
def dace_sin(x:dace.float64):
    return np.sin(x)

@dace.program
def dace_cos(x:dace.float64):
    return np.cos(x)

@dace.program
def dace_tan(x:dace.float64):
    return np.tan(x)

@dace.program
def dace_sinh(x:dace.float64):
    return np.sinh(x)

@dace.program
def dace_cosh(x:dace.float64):
    return np.cosh(x)

@dace.program
def dace_tanh(x:dace.float64):
    return np.tanh(x)

@dace.program
def dace_pow(x:dace.float64, e:dace.float64):
    return x**e

@dace.program
def dace_exp(x:dace.float64):
    return np.exp(x)

@dace.program
def dace_sqrt(x:dace.float64):
    return np.sqrt(x)

def generate_inputs(seed=12345):
    rng = np.random.default_rng(seed)

    inputs = []
    labels = []

    # --- A. Small-angle region (fast path) ---
    n_small = 1500
    x = rng.uniform(-2**-30, 2**-30, size=n_small)
    inputs.append(x)
    labels += ["small_angle"] * n_small

    # --- B. Primary polynomial region ---
    n_poly = 2500
    x = rng.uniform(-np.pi / 4, np.pi / 4, size=n_poly)
    inputs.append(x)
    labels += ["poly_region"] * n_poly

    # --- C. Medium magnitude (simple argument reduction) ---
    n_medium = 2500
    x = rng.uniform(-1e6, 1e6, size=n_medium)
    inputs.append(x)
    labels += ["medium_mag"] * n_medium

    # --- D. Large magnitude (Payne–Hanek reduction) ---
    n_large = 2500
    x = rng.uniform(-1e300, 1e300, size=n_large)
    inputs.append(x)
    labels += ["large_mag"] * n_large

    # --- E. Edge and special cases ---
    edge_cases = np.array([
        0.0, -0.0,
        np.pi, -np.pi,
        np.pi / 2, -np.pi / 2,
        np.inf, -np.inf,
        np.nan,
        np.nextafter(0.0, 1.0),
        -np.nextafter(0.0, 1.0),
        np.finfo(np.float64).max,
        -np.finfo(np.float64).max,
        np.finfo(np.float64).tiny,
        -np.finfo(np.float64).tiny,
    ])

    # Repeat and jitter edge cases slightly (where valid)
    n_edge = 1000
    idx = rng.integers(0, len(edge_cases), size=n_edge)
    x = edge_cases[idx].copy()

    # Add tiny jitter to finite, non-zero values
    finite_mask = np.isfinite(x) & (x != 0.0)
    x[finite_mask] += rng.uniform(-1e-12, 1e-12, size=finite_mask.sum())

    inputs.append(x)
    labels += ["edge_case"] * n_edge

    # --- Combine ---
    inputs = np.concatenate(inputs)
    labels = np.array(labels)

    assert inputs.shape[0] == 10_000
    return inputs, labels

def generate_inputs_uniform( lower_bound, upper_bound, seed=12345):
    rng = np.random.default_rng(seed)
    inputs = rng.uniform(-2**-30, 2**-30, size=10000)
    return inputs

if __name__ == "__main__":

    
    funcs = [dace_sin, dace_cos, dace_tan, dace_sinh, dace_tanh, dace_sqrt, dace_pow, dace_exp]
    for func in funcs:
        sdfg = func.to_sdfg()
        opt.auto_optimize(sdfg, dace.dtypes.DeviceType.CPU)
        sdfg.instrument = dace.InstrumentationType.PAPI_Counters
        
        import dace.sdfg.performance_evaluation.work_depth as wd
        
        papi.PAPIInstrumentation._counters = {"PAPI_DP_OPS"}

        ins, ls = generate_inputs()
        exps, expls = generate_inputs(54321)

        small = np.zeros(10000)
        big = np.zeros(10000)
        c_sdfg = sdfg.compile()
        if func == dace_pow or func == dace_exp:
            for c, i in enumerate(ins):
                    c_sdfg(i, exps[c])
                    small[c] = i
        else :
            for c, i in enumerate(ins):
                c_sdfg(i)
        new_reports = sorted(sdfg.get_instrumentation_reports(), key=lambda report: report.name, reverse=True)[0:10000]



        for i, report in enumerate(reversed(new_reports)):
            for uuid in report.counters:
                for sdfg_element in report.counters[uuid]:
                    for event_name in report.counters[uuid][sdfg_element]:
                        event_sum =  0
                        for tid in report.counters[uuid][sdfg_element][event_name]:
                            event_sum+=report.counters[uuid][sdfg_element][event_name][tid][0]
                big[i] = event_sum

        print("="*40, func.name, "="*40)
        print(np.mean(big), np.median(big), np.max(big), np.min(big))
        print(big)

