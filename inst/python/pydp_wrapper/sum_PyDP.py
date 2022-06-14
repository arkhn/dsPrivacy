import pydp as dp
from pydp.algorithms.laplacian import BoundedSum


def pyDP_bounded_sum(input_data, epsilon, lower_bound, upper_bound):
  x = BoundedSum(epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float")
  return x.quick_result(input_data)
