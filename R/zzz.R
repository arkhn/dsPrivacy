py_module <- NULL

.onLoad <- function(libname, pkgname) {
  library(reticulate)

  reticulate::use_virtualenv(virtualenv = ".venv", required = TRUE)
  py_module <<- reticulate::import_from_path(module = "pydp_wrapper", path = system.file("python", package = packageName()))
}
