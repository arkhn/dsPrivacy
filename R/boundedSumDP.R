#' @title Differentially private sum
#' @description Computes a differentially private sum of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private sum of the input vector
#' @export


boundedSumDP <- function(input_data, epsilon, lower_bound, upper_bound) {
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }

  res <- py_module$pydp_wrapper$sum_PyDP$pyDP_bounded_sum(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
