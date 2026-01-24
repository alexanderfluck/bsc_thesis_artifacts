import dace
import numpy as np

N = dace.symbol('N')
M = dace.symbol('M')
K = dace.symbol('K')

# Map-Reduce version of matrix multiplication
@dace.program
def matmul(A: dace.float64[M, K], B: dace.float64[K, N], C: dace.float64[M, N]):
    tmp = np.ndarray([M, N, K], dtype=A.dtype)

    # Multiply every pair of values to a large 3D temporary array
    for i, j, k in dace.map[0:M, 0:N, 0:K]:
        with dace.tasklet:
            in_A << A[i, k]
            in_B << B[k, j]
            out >> tmp[i, j, k]

            out = in_A * in_B

    # Sum last dimension of temporary array to obtain resulting matrix
    dace.reduce(lambda a, b: a + b, tmp, C, axis=2, identity=0)


@dace.program
def sec_sum(A: dace.float64[N]):
    sum = dace.define_local_scalar(dace.float64)
    for i in range(2, N):
        if i % 2 == 0:
            A[i]+=A[i-2]

@dace.program
def iterated_dot(a: dace.float64[N], b:dace.float64[N], c:dace.float64[N]):
    for i in range(1, N+1):
        c[i-1] =  np.dot(a[0:i], b[0:i])

import dace.sdfg.performance_evaluation.work_depth as wd

mm_sdfg = matmul.to_sdfg()
ss_sdfg = sec_sum.to_sdfg()
id_sdfg = iterated_dot.to_sdfg()



print(wd.analyze_sdfg(id_sdfg, {}, wd.get_tasklet_work_depth, [], False))

mm_sdfg.save("matmul.sdfg")
ss_sdfg.save("sec_sum.sdfg")
id_sdfg.save("iterated_dot.sdfg")