#' @title Differentially private count
#' @description Computes a differentially private count of the number of elements in a vector
#'
#' @param input_data the input vector
#' @param epsilon privacy budget
#'
#' @return a numeric, differentially private count of the number of elements in a vector
#' @export


countDP <- function(input_data, epsilon) {
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }

  res <- py_module$pydp_wrapper$count_PyDP$pyDP_count(input_data, epsilon)
  return(res)
}
