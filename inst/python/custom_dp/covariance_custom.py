import numpy as np

def custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max):
  a_min = min(x_min * y_min, x_min * y_max, x_max * y_min, x_max * y_max)
  a_max = max(x_min * y_min, x_min * y_max, x_max * y_min, x_max * y_max)

  d = x * y

  S = sum(d) - len(d) * (a_min + a_max) / 2 + np.random.laplace(0, (a_max - a_min) / epsilon)
  C = len(d) + np.random.laplace(0, 2 / epsilon)

  if C <= 1:
    return (a_min + a_max) / 2
  else:
    return S / C + (a_min + a_max) / 2
