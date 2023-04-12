#' @title Differentially private linear regression
#' @description Computes a differentially private linear regression
#'
#' @param target_column target response
#' @param input_columns explanatory variables
#' @param epsilon privacy budget
#'
#' @return an array containing the linear regression coefficients
#' @export


linearRegressionDP <- function(target_column, input_columns, epsilon) {
  cbindtext <- paste0("cbind(", input_columns, ")")
  input_X <- eval(parse(text=cbindtext), envir = parent.frame())

  input_X_noNA <- input_X[complete.cases(input_X),]
  target_column_noNA <- target_column[complete.cases(input_X)]

  res <- py_module$diffprivlib_wrapper$linear_regression$linear_regression(input_X_noNA, target_column_noNA, epsilon)
  return(res)
}
