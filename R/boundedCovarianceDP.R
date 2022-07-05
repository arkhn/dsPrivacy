#' @title Differentially private covariance
#' @description Computes a differentially private covariance of a vector
#'
#' @param x the first input vector
#' @param y the second input vector
#' @param epsilon privacy budget
#' @param x_min lower bound for x
#' @param x_max upper bound for x
#' @param y_min lower bound for y
#' @param y_max upper bound for y
#'
#' @return a numeric, differentially private covariance of the input vectors x and y
#' @export


boundedCovarianceDP <- function(x, y, epsilon, x_min, x_max, y_min, y_max){
  res <- py_module$covariance_custom$custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max)
  return(res)
}
