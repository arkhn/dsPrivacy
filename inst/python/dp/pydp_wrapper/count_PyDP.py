from pydp.algorithms.laplacian import Count


def pyDP_count(input_data, epsilon):
  x = Count(epsilon=epsilon, dtype="float")
  return x.quick_result(input_data)
