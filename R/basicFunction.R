#' Title
#'
#' @param object
#' @param option
#'
#' @return
#' @export
#'
#' @examples
meanDPDS <- function(object, option){
  if(option){
    object <- sum(object)
  }
  else{
    object <- mean(object)
  }
  return(object)
}
