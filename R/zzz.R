py_module <- NULL

.onLoad <- function(libname, pkgname) {
  library(reticulate)

  reticulate::use_virtualenv(virtualenv = "/var/lib/rock/.virtualenvs/.venv", required = TRUE)
  py_module <<- reticulate::import_from_path(module = "mean_PyDP", path = system.file("python/pydp_wrapper", package = packageName()))
  print(py_list_attributes(py_module))
}
