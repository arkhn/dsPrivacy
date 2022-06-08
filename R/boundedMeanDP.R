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


boundedMeanDP <- function(input_data, epsilon, lower_bound, upper_bound){
  res <- py_module$mean_PyDP$pyDP_bounded_mean(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
