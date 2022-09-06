#' @title Differentially private median
#' @description Computes a differentially private median of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private median of the input vector
#' @export


medianDP <- function(input_data, epsilon, lower_bound, upper_bound) {
  res <- py_module$pydp_wrapper$median_PyDP$pyDP_median(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
