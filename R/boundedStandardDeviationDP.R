#' @title Differentially private standard deviation
#' @description Computes a differentially private standard deviation of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private standard deviation of the input vector


boundedStandardDeviationDP <- function(input_data, epsilon, lower_bound, upper_bound){
  res <- py_module$standard_deviation_PyDP$pyDP_bounded_standard_deviation(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
