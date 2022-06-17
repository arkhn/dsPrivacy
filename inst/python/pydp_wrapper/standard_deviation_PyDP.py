import pydp as dp
from pydp.algorithms.laplacian import BoundedStandardDeviation


def pyDP_bounded_standard_deviation(input_data, epsilon, lower_bound, upper_bound):
    x = BoundedStandardDeviation(
        epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float"
    )
    return x.quick_result(input_data)
