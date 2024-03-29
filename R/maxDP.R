#' @title Differentially private max
#' @description Computes a differentially private max of a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#' @param lower_bound lower bound for input values
#' @param upper_bound upper bound for input values
#'
#' @return a numeric, differentially private max of the input vector
#' @export


maxDP <- function(input_data, epsilon, lower_bound, upper_bound) {
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }

  res <- py_module$pydp_wrapper$max_PyDP$pyDP_max(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
