#' @title Differentially private sum
#' @description Computes a differentially private sum of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private sum of the input vector


boundedSumDP <- function(input_data, epsilon, lower_bound, upper_bound){
  res <- py_module$sum_PyDP$pyDP_bounded_sum(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}