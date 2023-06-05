#' @title Differential sum
#' @description Computes a differentially private sum of a vector
#'
#' @param input_data the input vector
#' @param epsilon Privacy budget
#' @param lower_bound Lower bound for input_data
#' @param upper_bound Upper bound for input_data
#'
#' @return a numeric, differentially private sum of the input vector
#' @export


sumDP <- function(input_data, epsilon, lower_bound, upper_bound) {
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }

  sum <- py_module$pydp_wrapper$sum_PyDP$pyDP_bounded_sum(input_data, epsilon, lower_bound, upper_bound)
  return(sum)
}
