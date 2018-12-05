check_for_tests <- function(testdir) {
  
  res <- TRUE

  on.exit(return(invisible(res)),add = TRUE)
  
  if (!dir.exists(file.path(testdir, "testthat"))) {
    res <- FALSE 
    stop(sprintf("testthat subdirectory does not exists in: '%s'", testdir))
  }

  if (length(list.files(file.path(testdir, "testthat"))) == 0) {
    res <- FALSE
    stop(sprintf("tests/testthat subdirectory does contain any test files in: '%s'", testdir))
  }

}

#' @importFrom utils installed.packages
check_for_pkgs <- function(pkg) {
  pkgs_current <- rownames(utils::installed.packages())

  pkg <- normalizePath(pkg, mustWork = FALSE)

  if (!file.exists(file.path(pkg, "DESCRIPTION"))) {
    stop(sprintf("No package DESCRIPTION file in %s", pkg))
  }

  desc <- as.list(read.dcf(file.path(pkg, "DESCRIPTION"))[1, ])

  dep_imp <- desc[intersect(c("Depends", "Imports"), names(desc))]

  pkg_deps <- gsub("\\s(.*?)$", "", unlist(lapply(dep_imp, strsplit, ","), use.names = FALSE))

  pkg_deps <- union(pkg_deps, c("testthat", "knitr"))

  pkg_deps <- pkg_deps[!grepl("R", pkg_deps)]

  ret <- setdiff(pkg_deps, pkgs_current)

  on.exit(invisible(ret),add = TRUE)
  
  if ( length(ret) > 0 ) {
    
    stop(
      sprintf("The following packages must be installed: %s",
      paste0(ret, collapse = ","))
    )
    
  }

}

create_viewer <- function() {
  viewer <- getOption("viewer")

  if (!is.null(viewer)) {
    viewerFunc <- function(url) {
      viewer(url)
    }
  }

  else {
    viewerFunc <- utils::browseURL
  }

  return(viewerFunc)
}
