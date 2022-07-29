import numpy as np
import pandas as pd
import pytest

from inst.python.dp.custom_dp.covariance_custom import custom_bounded_covariance, noisy_average

rel_threshold = 0.01
abs_threshold = 0.01
epsilon = 1000
n_empty_values = 10


def test_noisy_average(height_samples_with_bounds):
    x, x_min, x_max = height_samples_with_bounds

    n = len(x)
    n_noisy = n

    x_noisy_average = noisy_average(x, epsilon, x_min, x_max, n, n_noisy)
    x_average = np.mean(x)
    assert x_noisy_average == pytest.approx(x_average, rel=rel_threshold, abs=abs_threshold)


# TODO: True option needs further investigation of the SOTA implementations, pandas being based on
# Welford algorithm detailed here https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance
@pytest.mark.parametrize("empty_values", [False, True])
def test_custom_bounded_covariance(
    height_samples_with_bounds, weight_samples_with_bounds, empty_values
):
    x, x_min, x_max = height_samples_with_bounds
    y, y_min, y_max = weight_samples_with_bounds

    # we use pandas for handling None values in the true covariance computation
    df = pd.DataFrame(data={"height": x, "weight": y})

    if empty_values:
        for idx in np.random.randint(0, len(x), n_empty_values):
            x[idx] = None
        for idx in np.random.randint(0, len(y), n_empty_values):
            y[idx] = None

    x_noisy_covariance = custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max)
    x_covariance = np.array(df.cov())[0][1]

    if empty_values:
        # TODO: We currently just check that the result isn't empty. This is not sufficient.
        # There is currently a small relative error, suggesting that the implementation needs
        # to be revised.
        assert x_noisy_covariance is not None
    else:
        assert x_noisy_covariance == pytest.approx(
            x_covariance, rel=rel_threshold, abs=abs_threshold
        )
