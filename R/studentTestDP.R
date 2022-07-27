#' @title Calculations needed to compute the client-side Differential Student-test
#' @description Send the necessary calculations for one group to compute student-test on the client side with differential privacy
#'
#  ' @param x One group to compare with the student-test
#  ' @param epsilon Privacy budget
#  ' @param x_min Lower bound for x
#  ' @param x_max Upper bound for x
#'
#' @return a named list with 3 differentially private numeric values: the sum (Sum), the sum of squares (SumSquares) and the length of valid elements (Nvalid) of the input vector
#' @export


calculationsForStudentTestDP <- function(x, epsilon, x_min, x_max){
  split_epsilon <- epsilon / 3 
  length <- py_module$pydp_wrapper$count_PyDP$pyDP_count(x[!is.na(x)], split_epsilon)
  sum <- py_module$pydp_wrapper$sum_PyDP$pyDP_bounded_sum(x, split_epsilon, x_min, x_max)
  xx_min <- min(x_min^2, x_max^2)
  xx_max <- max(x_min^2, x_max^2)
  sum_squares <- py_module$pydp_wrapper$sum_PyDP$pyDP_bounded_sum(x^2, split_epsilon, xx_min, xx_max)

  return(list(Sum=sum, SumSquares=sum_squares, Nvalid=length))
}