#' @title Differentially private min
#' @description Computes a differentially private min of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private min of the input vector
#' @export


minDP <- function(input_data, epsilon, lower_bound, upper_bound) {
  res <- py_module$pydp_wrapper$min_PyDP$pyDP_min(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
