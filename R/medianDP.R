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


medianDP <- function(input_data, epsilon, lower_bound, upper_bound){
  res <- py_module$median_PyDP$pyDP_median(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
