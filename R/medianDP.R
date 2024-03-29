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
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }

  median <- py_module$pydp_wrapper$median_PyDP$pyDP_median(input_data, epsilon / 2, lower_bound, upper_bound)
  length <- py_module$pydp_wrapper$count_PyDP$pyDP_count(input_data, epsilon / 2)

  return(list(Median = median, Ntotal = length))
}
