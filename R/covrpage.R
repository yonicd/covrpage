#' @title render covrpage
#' @description Render the template of the covrpage in the package directory.
#' @param pkg path to package
#' @seealso 
#'  \code{\link[rmarkdown]{render}}
#' @rdname covrpage
#' @export 
#' @importFrom rmarkdown render
covrpage <- function(pkg){
  
  testdir <- file.path(pkg,'tests')
  
  thiswd <- getwd()
  
  on.exit({
    
    if(file.exists('tests/_covrpage.Rmd'))
      file.remove('tests/_covrpage.Rmd')
    
    if(file.exists('tests/README.html'))
      file.remove('tests/README.html')
    
    setwd(thiswd)
    },add = TRUE)
  
  setwd(pkg)
  
  chk <- check_for_tests(testdir)
  
  if(chk>0){
    if(chk==1)
      stop(sprintf("tests subdirectory does not exists in: '%s'", pkg))
    
    if(chk==2)
      stop(sprintf("tests/testthat subdirectory does contain any files in: '%s'", pkg))
  }
  
  chk_pgks <- check_for_pkgs()
  
  if(length(chk_pgks)){
    stop(sprintf('The following packages must be intalled: %s', 
                 paste0(chk_pgks,collapse=','))
         )
  }
  
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

check_for_pkgs <- function(){
  
  pkgs <- rownames(installed.packages())
  
  chk_pkgs <- c('dplyr','tidyr','covr','devtools','knitr')
  
  setdiff(chk_pkgs,pkgs)
  
}