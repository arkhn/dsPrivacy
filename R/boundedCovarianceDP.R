#' @title Differentially private covariance
#' @description Compute a differential implementation of the covariance
#'
#' @param x First input to the covariance
#' @param y Second input to the covariance
#' @param epsilon Privacy budget
#' @param x_min Lower bound for x
#' @param x_max Upper bound for x
#' @param y_min Lower bound for y
#' @param y_max Upper bound for y
#'
#' @return a numeric, differentially private covariance of the input vectors x and y
#' @export


boundedCovarianceDP <- function(x, y, epsilon, x_min, x_max, y_min, y_max) {
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }
  res <- py_module$custom_dp$covariance_custom$custom_bounded_covariance(x, y, epsilon, x_min, x_max, y_min, y_max)
  return(res)
}
