import numpy as np
import pytest

from inst.python.dp.custom_dp.covariance_custom import custom_bounded_covariance, noisy_average

relative_threshold = 0.01
epsilon = 100


def test_noisy_average(height_samples_with_bounds):
    x, x_min, x_max = height_samples_with_bounds

    n = len(x)
    n_noisy = n

    x_noisy_average = noisy_average(x, epsilon, x_min, x_max, n, n_noisy)
    x_average = np.mean(x)
    assert x_noisy_average == pytest.approx(x_average, rel=relative_threshold)


def test_custom_bounded_covariance(height_samples_with_bounds, weight_samples_with_bounds):
    x, x_min, x_max = height_samples_with_bounds
    y, y_min, y_max = weight_samples_with_bounds

    x_noisy_covariance = custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max)
    x_covariance = np.cov(x, y)[0][1]

    assert x_noisy_covariance == pytest.approx(x_covariance, rel=relative_threshold)
