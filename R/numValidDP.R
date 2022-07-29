#' @title Differential count of valid elements
#' @description Computes a differentially private count of valid elements of a vector
#'
#' @param input_data the input vector
#' @param epsilon Privacy budget
#'
#' @return a numeric, differentially private count of valid elements of the input vector
#' @export


numValidDP <- function(input_data, epsilon){
  length <- py_module$pydp_wrapper$count_PyDP$pyDP_count(input_data[!is.na(input_data)], epsilon)
  return(length)
}