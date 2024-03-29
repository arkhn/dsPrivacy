import numpy as np
import pytest

n = 1000


@pytest.fixture
def height_samples_with_bounds():
    """Output a vector of values simulating height samples with value bounds"""
    height_min = 150
    height_max = 200
    height = np.random.uniform(height_min, height_max, n)
    return height, height_min, height_max


@pytest.fixture
def weight_samples_with_bounds():
    """Output a vector of values simulating weight samples with value bounds"""
    height = np.random.uniform(150, 200, n)
    weight = height / 2.5 + np.random.uniform(-20, 20, n)
    weight_min = 40
    weight_max = 100
    return weight, weight_min, weight_max
