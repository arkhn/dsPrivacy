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


maxDP <- function(input_data, epsilon, lower_bound, upper_bound){
  res <- py_module$max_PyDP$pyDP_max(input_data, epsilon, lower_bound, upper_bound)
  return(res)
}
