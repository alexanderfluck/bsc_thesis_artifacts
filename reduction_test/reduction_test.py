import dace
import dace.transformation.auto.auto_optimize as opt
import numpy as np
from dace.codegen.instrumentation import papi

def generate_inputs_uniform( lower_bound:float=-2.0**60, upper_bound:float=2.0**60, size=10, seed=12345):
    rng = np.random.default_rng(seed)
    inputs = rng.uniform(lower_bound, upper_bound, size)
    return inputs, []

# Define the symbolic size
N = dace.symbol('N')

@dace.program
def threaded_reduction(A: dace.float64[N], result: dace.float64[1]):
    # Initialize result
    result[0] = np.min(A)


sdfg = threaded_reduction.to_sdfg()
opt.auto_optimize(sdfg, dace.dtypes.DeviceType.CPU)

sdfg.instrument = dace.InstrumentationType.PAPI_Counters
papi.PAPIInstrumentation._counters = {"PAPI_DP_OPS"}   
data, _ = generate_inputs_uniform(size=10000)
res, _ = generate_inputs_uniform(size=1)
c_sdfg = sdfg.compile()

for i in range(20):
    c_sdfg(data, res, N=10000)

new_reports = sorted(sdfg.get_instrumentation_reports(), key=lambda report: report.name, reverse=True)[0:20]

event_sums = dict()
for i, report in enumerate(reversed(new_reports)):
    for uuid in report.counters:
        for sdfg_element in report.counters[uuid]:
            for event_name in report.counters[uuid][sdfg_element]:
                event_sum =  0
                for tid in report.counters[uuid][sdfg_element][event_name]:
                    event_sum+=report.counters[uuid][sdfg_element][event_name][tid][0]
                
                if event_name not in event_sums.keys():
                    event_sums[event_name] = []

                print("PAPI_DP_OPS:", event_sum)