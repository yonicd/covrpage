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
  pkgs_current <- utils::installed.packages()[,c(1)]

  pkg <- normalizePath(pkg, mustWork = FALSE)

  if (!file.exists(file.path(pkg, "DESCRIPTION"))) {
    stop(sprintf("No package DESCRIPTION file in %s", pkg))
  }

  desc <- as.list(read.dcf(file.path(pkg, "DESCRIPTION"))[1, ])

  dep_imp <- desc[intersect(c("Depends", "Imports"), names(desc))]

  dep_imp_clean <- lapply(dep_imp, function(x){
    x <- gsub('\\s+|\\n','',x)
    strsplit(x, ",") 
  })
  
  pkg_deps <- gsub("\\s(.*?)$", "", unlist(dep_imp_clean, use.names = FALSE))

  pkg_deps <- union(pkg_deps, c("testthat", "knitr"))

  pkg_deps <- pkg_deps[!grepl("R", pkg_deps)]
  
  #strip out version from import names
  pkg_names <- gsub('\\s*\\((.*?)$','',pkg_deps) 
  
  # pkg_versions <- mapply(
  #   FUN = function(x,y) gsub(sprintf('%s|\\(|\\)|[>=]',x),'',y), 
  #   pkg_names,pkg_deps,
  #   USE.NAMES = FALSE
  # )
  
  #pkg_deps <- data.frame(name = pkg_names, version = pkg_versions, stringsAsFactors = FALSE)
  
  ret <- setdiff(pkg_names, pkgs_current)

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
