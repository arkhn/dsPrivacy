import numpy as np


def lap(scale):
    """Compute Laplacian noise"""
    return np.random.laplace(0, scale)


def noisy_average(x, epsilon, x_min, x_max, N, N_noisy):
    """
    Implement the NoisyAverage with Normalization algorithm
    from https://books.google.fr/books?id=WFttDQAAQBAJ&pg=PA29.

    We assume that N and N_noisy are already computed
    """
    assert x_min <= x_max, "Verify that you bounds are corrected ordered"

    # Crop the data using the bounds provided
    x = np.clip(x, x_min, x_max)

    normalized_sum_x = sum(x) - N * (x_min + x_max) / 2 + lap((x_max - x_min) / epsilon)

    if N_noisy <= 1:
        E_x = (x_min + x_max) / 2
    else:
        E_x = normalized_sum_x / N_noisy + (x_min + x_max) / 2

    return E_x


def custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max):
    """
    Manual implementation of the covariance with differential privacy
    """
    assert len(x) == len(y), "Variables should have the same length"

    # Since we compute 4 differentially private operations, we split the budget
    eps = epsilon / 4

    # Compute the exact and noisy count, as needed for `noisy_average`
    N = len(x)
    N_noisy = len(x) + lap(2 / eps)

    # Compute noisy average for each variables
    E_x = noisy_average(x, eps, x_min, x_max, N, N_noisy)
    E_y = noisy_average(y, eps, y_min, y_max, N, N_noisy)

    # As we shift the variables, we shift their bounds as well
    x_min_, x_max_ = x_min - E_x, x_max - E_x
    y_min_, y_max_ = y_min - E_y, y_max - E_y

    # Compute the product bounds
    xy_min = min(x_min_ * y_min_, x_min_ * y_max_, x_max_ * y_min_, x_max_ * y_max_)
    xy_max = max(x_min_ * y_min_, x_min_ * y_max_, x_max_ * y_min_, x_max_ * y_max_)

    # Shift the variables and compute their product
    xy_ = (x - E_x) * (y - E_y)

    # Compute the noisy average of the normalized product, ie the covariance
    E_xy = noisy_average(xy_, eps, xy_min, xy_max, N, N_noisy)

    # N - 1 is used to have an unbiased estimate (like standard implem in numpy)
    E_xy = N_noisy / (N_noisy - 1) * E_xy
    return E_xy
