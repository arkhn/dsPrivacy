import pydp as dp
from pydp.algorithms.laplacian import Min


def pyDP_min(input_data, epsilon, lower_bound, upper_bound):
    x = Min(
        epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float"
    )
    return x.quick_result(input_data)
