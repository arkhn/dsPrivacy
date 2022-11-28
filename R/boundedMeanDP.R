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
  epsilon_threshold <- 0.1 * epsilon
  epsilon_remaining <- epsilon - epsilon_threshold

  length <- py_module$pydp_wrapper$count_PyDP$pyDP_count(input_data, epsilon_threshold)

  minRowsDP <- as.numeric(getOption("dsPrivacy.minRowsDP", default = 0))

  if (length < minRowsDP) {
    return(list(
      Mean = NA,
      Ntotal = NA,
      ErrorMsg = sprintf("ERROR: not enough rows to use DP (estimated: %s, required %s)", length, minRowsDP)
    ))
  }

  mean <- py_module$pydp_wrapper$mean_PyDP$pyDP_bounded_mean(input_data, epsilon_remaining, lower_bound, upper_bound)

  return(list(Mean = mean, Ntotal = length, ErrorMsg = NA))
}
