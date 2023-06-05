#' @title Differentially private table
#' @description Computes a differentially private contingency table
#'
#' @param x first input vector
#' @param y second input vector
#' @param epsilon privacy budget
#'
#' @return differentially private contingency table
#' @export


tableDP <- function(x, y, epsilon) {
  # Don't answer the query if epsilon is too high
  if(epsilon > 100){
    stop("FAILED: espilon should be less than 100", call. = FALSE)
  }

  table <- DPpack::tableDP(x, y, eps = epsilon, which.sensitivity = "bounded", mechanism = "Laplace", type.DP = "pDP")
  return(table)
}
