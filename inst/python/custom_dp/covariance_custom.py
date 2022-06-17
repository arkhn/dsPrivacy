import numpy as np


def lap(scale):
  return np.random.laplace(0, scale)

def custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max):
  """

  Args:
    x:
    y:
    epsilon:
    x_min:
    x_max:
    y_min:
    y_max:

  Returns:

  """
  # TODO distribute epsilon
  assert len(x) == len(y), "Variables should have the same length"
  assert x_min <= x_max, "Verify that you bounds are corrected ordered"
  assert y_min <= y_max, "Verify that you bounds are corrected ordered"

  # Crop the data using the bounds provided
  x = np.min(x_max, np.max(x_min, x))
  y = np.min(y_max, np.max(y_min, y))

  # Compute the DP count once
  N = len(x) + np.random.laplace(0, 2 / epsilon)

  # Compute the sensitivity bounds for the product of the variables
  a_min = min(x_min * y_min, x_min * y_max, x_max * y_min, x_max * y_max)
  a_max = max(x_min * y_min, x_min * y_max, x_max * y_min, x_max * y_max)

  # Apply the NoisyAverage with Normalization algorithm
  # from https://books.google.fr/books?id=WFttDQAAQBAJ&pg=PA29
  normalized_sum_xy = sum(x * y) - N * (a_min + a_max) / 2 + lap(0, (a_max - a_min) / epsilon)
  normalized_sum_x = sum(x) - N * (x_min + x_max) / 2 + lap((x_max - x_min) / epsilon)
  normalized_sum_y =  sum(y) - N * (y_min + y_max) / 2 + lap(0, (y_max - y_min) / epsilon)

  if N <= 1:
    E_xy = (a_min + a_max) / 2
    E_x = (x_min + x_max) / 2
    E_y = (y_min + y_max) / 2
  else:
    E_xy = normalized_sum_xy / N + (a_min + a_max) / 2
    E_x = normalized_sum_x / N + (x_min + x_max) / 2
    E_y = normalized_sum_y / N + (y_min + y_max) / 2

  # N - 1 is used to have an unbiased estimate (like standard implem in numpy)
  return N / (N - 1) * (E_xy - E_x * E_y)