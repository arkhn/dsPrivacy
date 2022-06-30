#' @title Differentially private mean
#' @description Computes a differentially private mean of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private mean of the input vector
#' @export


boundedMeanDP <- function(input_data, epsilon, lower_bound, upper_bound){
  mean <- py_module$mean_PyDP$pyDP_bounded_mean(input_data, epsilon, lower_bound, upper_bound)
  total <- length(input_data)

  return(list(Mean=mean, Ntotal=total))
}
