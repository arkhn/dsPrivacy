import numpy as np


def lap(scale: float) -> float:
    """Compute a scalar Laplacian noise.

    Args:
        scale: Variance of the noise
    """
    return np.random.laplace(0, scale)


def noisy_average(
    x: np.array, epsilon: float, x_min: float, x_max: float, n: int, n_noisy: int
) -> float:
    """Compute a differential implementation of the average.

    This is the implementation of the NoisyAverage with Normalization algorithm from
    https://books.google.fr/books?id=WFttDQAAQBAJ&pg=PA29. We assume here that n and
    n_noisy are already computed.

    Args:
        x: Input
        epsilon: Privacy budget
        x_min: Minimum bound for x
        x_max: Maximum bound for x
        n: Number of elements in x
        n_noisy: Differentially private estimation of n
    """

    if x_min > x_max:
        raise ValueError("Verify that you bounds are corrected ordered.")

    if n_noisy <= 1:
        return (x_min + x_max) / 2

    # Crop the data using the bounds provided
    x = np.clip(x, x_min, x_max)

    noisy_sum_normalized_x = (
        np.nansum(x) - n * (x_min + x_max) / 2 + lap((x_max - x_min) / (2 * epsilon))
    )

    noisy_average_x = noisy_sum_normalized_x / n_noisy + (x_min + x_max) / 2

    return noisy_average_x


def custom_bounded_covariance(
    x: np.array,
    y: np.array,
    epsilon: float,
    x_min: float,
    x_max: float,
    y_min: float,
    y_max: float,
) -> float:
    """Compute a differential implementation of the covariance.

    This is a manual implementation of the covariance with differential privacy. Note
    that the privacy budget is split across the 4 differentially private operations.

    Args:
        x: First input to the covariance
        y: Second input to the covariance
        epsilon: Privacy budget
        x_min: Minimum bound for x
        x_max: Maximum bound for x
        y_min: Minimum bound for y
        y_max: Maximum bound for y
    """
    if len(x) != len(y):
        raise ValueError("Variables should have the same length.")

    x = np.array(x)
    y = np.array(y)

    # Since we compute 4 differentially private operations, we split the budget
    eps_per_query = epsilon / 4

    # Compute the index where both variables are not NaN
    both_not_nan_index = ~np.isnan(x) & ~np.isnan(y)

    # Compute exact and noisy count for non NaN variables, and filter NaN
    n = np.sum(both_not_nan_index)
    x = x[both_not_nan_index]
    y = y[both_not_nan_index]
    n_noisy = n + lap(2 / eps_per_query)

    # Compute noisy average for each variable
    noisy_average_x = noisy_average(x, eps_per_query, x_min, x_max, n, n_noisy)
    noisy_average_y = noisy_average(y, eps_per_query, y_min, y_max, n, n_noisy)

    # As we shift the variables, we shift their bounds as well
    x_min_, x_max_ = x_min - noisy_average_x, x_max - noisy_average_x
    y_min_, y_max_ = y_min - noisy_average_y, y_max - noisy_average_y

    # Compute the product bounds
    xy_min = min(x_min_ * y_min_, x_min_ * y_max_, x_max_ * y_min_, x_max_ * y_max_)
    xy_max = max(x_min_ * y_min_, x_min_ * y_max_, x_max_ * y_min_, x_max_ * y_max_)

    # Shift the variables and compute their product
    xy_normalized = (x - noisy_average_x) * (y - noisy_average_y)

    # Compute the noisy average of the normalized product, ie the covariance
    noisy_average_xy = noisy_average(xy_normalized, eps_per_query, xy_min, xy_max, n, n_noisy)

    # n - 1 is used to have an unbiased estimate (like standard implem in numpy)
    unbiased_noisy_average_xy = noisy_average_xy * n_noisy / (n_noisy - 1)
    return unbiased_noisy_average_xy
