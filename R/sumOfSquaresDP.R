#' @title Differential sum of squares
#' @description Computes a differentially private sum of squares of a vector
#'
#' @param input_data the input vector
#' @param epsilon Privacy budget
#' @param lower_bound Lower bound for input_data
#' @param upper_bound Upper bound for input_data
#'
#' @return a numeric, differentially private sum of squares of the input vector
#' @export


sumOfSquaresDP <- function(input_data, epsilon, lower_bound, upper_bound){
  lower_bound_square <- min(lower_bound^2, upper_bound^2)
  upper_bound_square <- max(lower_bound^2, upper_bound^2)
  sum_of_squares <- py_module$pydp_wrapper$sum_PyDP$pyDP_bounded_sum(input_data^2, epsilon, lower_bound_square, upper_bound_square)
  return(sum_of_squares)
}