import pydp as dp
from pydp.algorithms.laplacian import Max


def pyDP_max(input_data, epsilon, lower_bound, upper_bound):
    x = Max(
        epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float"
    )
    return x.quick_result(input_data)
