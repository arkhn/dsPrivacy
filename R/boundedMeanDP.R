#' @title Differentially private mean
#' @description Computes a differentially private mean of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a named list with 2 differentially private numeric values: the mean (Mean) and the length (Ntotal) of the input vector
#' @export


boundedMeanDP <- function(input_data, epsilon, lower_bound, upper_bound) {
  mean <- py_module$pydp_wrapper$mean_PyDP$pyDP_bounded_mean(input_data, epsilon / 2, lower_bound, upper_bound)
  length <- py_module$pydp_wrapper$count_PyDP$pyDP_count(input_data, epsilon / 2)

  return(list(Mean = mean, Ntotal = length))
}
