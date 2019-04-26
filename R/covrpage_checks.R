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

  ret <- compare_pkgs(pkg)

  on.exit(invisible(ret$Package),add = TRUE)
  
  if ( nrow(ret) > 0 ) {
    
    ret_str <- sprintf('%s: Required: %s Installed: %s',
                       ret$Package,
                       ret$Desc_Version,
                       ret$Installed_Version)
    
    stop(
      sprintf("The following packages must be installed/updated:\n%s",
      paste0(ret_str, collapse = "\n"))
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
