from pydp.algorithms.laplacian import BoundedVariance


def pyDP_bounded_variance(input_data, epsilon, lower_bound, upper_bound):
    x = BoundedVariance(
        epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float"
    )
    return x.quick_result(input_data)
