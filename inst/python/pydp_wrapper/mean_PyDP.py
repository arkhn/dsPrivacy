import pydp as dp
from pydp.algorithms.laplacian import BoundedMean


def pyDP_bounded_mean(input_data, epsilon, lower_bound, upper_bound):
    x = BoundedMean(
        epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float"
    )
    return x.quick_result(input_data)
