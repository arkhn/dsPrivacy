import numpy as np

from inst.python.dp.custom_dp.covariance_custom import custom_bounded_covariance, noisy_average


def test_noisy_average():
    x = np.array([167, 192, 173, 174, 172, 167, 171, 185, 163, 170])

    n = len(x)
    n_noisy = n

    x_min = 150
    x_max = 200

    epsilon = 100

    x_noisy_average = noisy_average(x, epsilon, x_min, x_max, n, n_noisy)
    x_average = np.mean(x)
    assert np.abs(x_noisy_average - x_average) / x_average < 0.01


def test_custom_bounded_covariance():
    n = 1000
    x = np.random.uniform(150, 200, n)
    y = x / 2.5 + np.random.uniform(-20, 20, n)

    x_min = 150
    x_max = 200

    y_min = 40
    y_max = 100

    epsilon = 100

    x_noisy_covariance = custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max)
    x_covariance = np.cov(x, y)[0][1]

    assert np.abs(x_noisy_covariance - x_covariance) / x_covariance < 0.01
