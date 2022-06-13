import pydp as dp
from pydp.algorithms.laplacian import Median


def pyDP_median(input_data, epsilon, lower_bound, upper_bound):
  x = Median(epsilon=epsilon, lower_bound=lower_bound, upper_bound=upper_bound, dtype="float")
  return x.quick_result(input_data)
