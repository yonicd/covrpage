#' @title render covrpage
#' @description Render the template of the covrpage in the package directory.
#' @param pkg path to package
#' @param preview boolean, to open the output in viewer, Default: TRUE
#' @seealso 
#'  \code{\link[rmarkdown]{render}}
#' @rdname covrpage
#' @export 
#' @importFrom rmarkdown render
covrpage <- function(pkg, preview = TRUE){
  
  testdir <- file.path(pkg,'tests')
  
  thiswd <- getwd()
  
  on.exit({
    
    if(preview){
      viewer <- getOption("viewer")
      viewer('tests/README.html')
      Sys.sleep(5)
    }

    if(file.exists('tests/_covrpage.Rmd'))
      file.remove('tests/_covrpage.Rmd')
    
    if(file.exists('tests/README.html'))
      file.remove('tests/README.html')
    
    setwd(thiswd)
    },add = TRUE)
  
  chk_pgks <- check_for_pkgs(pkg)
  
  if(length(chk_pgks)>0){
    stop(sprintf('The following packages must be installed: %s', 
                 paste0(chk_pgks,collapse=','))
    )
  }
  
  chk <- check_for_tests(file.path(pkg,testdir))
  
  if(chk>0){
    if(chk==1)
      stop(sprintf("tests subdirectory does not exists in: '%s'", pkg))
    
    if(chk==2)
      stop(sprintf("tests/testthat subdirectory does contain any test files in: '%s'", pkg))
  }
  
  setwd(pkg)
  
  file.copy(system.file('covrpage.Rmd',package = 'covrpage'),
            'tests/_covrpage.Rmd')
  
    rmarkdown::render(
      input = 'tests/_covrpage.Rmd',
      output_file = 'README.md',
      output_dir = 'tests',
      output_format = 'github_document',
      output_options = list(toc=TRUE,toc_depth=3)
    )

}

check_for_tests <- function(testdir){

  res <- 0
  
  if(!dir.exists('tests/testthat'))
    res <- 1
  
  if(length(list.files('tests/testthat'))==0)
    res <- 2
  
  return(res)
}

#'@importFrom utils installed.packages
check_for_pkgs <- function(pkg){
  
  pkgs_current <- rownames(utils::installed.packages())
  
  pkg <- normalizePath(pkg,mustWork = FALSE)
  
  if(!file.exists(file.path(pkg,'DESCRIPTION')))
    stop(sprintf('No package DESCRIPTION file in %s',pkg))
  
  desc <- as.list(read.dcf(file.path(pkg,'DESCRIPTION'))[1,])
  
  dep_imp <- desc[intersect(c('Depends','Imports'),names(desc))]
  
  pkg_deps <- gsub('\\s(.*?)$','',unlist(lapply(dep_imp,strsplit,','),use.names = FALSE))
  
  pkg_deps <- union(pkg_deps,c('testthat','knitr'))
  
  pkg_deps <- pkg_deps[!grepl('R',pkg_deps)]
  
  ret <- setdiff(pkg_deps,pkgs_current)
  
  if(length(ret)==0)
    return(c())
  
  if(!nzchar(ret))
    return(c())
  
  ret
  
}
