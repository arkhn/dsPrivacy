from diffprivlib.models import LinearRegression


def linear_regression(input_X, input_y, epsilon):
    reg = LinearRegression(epsilon=epsilon)
    reg.fit(input_X, input_y)
    return reg.coef_
