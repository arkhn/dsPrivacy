#' Title
#'
#' @param input_data
#' @param epsilon
#' @param delta
#' @param lower_bound
#' @param upper_bound
#'
#' @return
#' @export
#'
#' @examples


boundedSumDP <- function(input_data, epsilon, delta, lower_bound, upper_bound){
  res <- py_module$sum_PyDP$pyDP_bounded_sum(input_data, epsilon, delta, lower_bound, upper_bound)
  return(res)
}
