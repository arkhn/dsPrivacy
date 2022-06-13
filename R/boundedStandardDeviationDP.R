#' Title
#'
#' @param input_data
#' @param epsilon
#' @param lower_bound
#' @param upper_bound
#'
#' @return
#' @export
#'
#' @examples


boundedStandardDeviationDP <- function(input_data, epsilon, lower_bound, upper_bound){
  res <- py_module$standard_deviation_PyDP$pyDP_bounded_standard_deviation(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
