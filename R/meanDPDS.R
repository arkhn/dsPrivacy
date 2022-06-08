#' Title
#'
#' @param object
#' @param option
#'
#' @return
#' @export
#'
#' @examples
meanDPDS <- function(object){
  res <- mean(object, na.rm = TRUE)
  return(res)
}
