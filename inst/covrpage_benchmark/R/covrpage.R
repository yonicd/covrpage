#' @title render covrpage
#' @description Render the template of the covrpage in the package directory.
#' @param pkg path to package
#' @param preview boolean, to open the output in viewer, Default: TRUE
#' @param auto_push boolean, push to remote repo on exit, Default: FALSE
#' @seealso 
#'  \code{\link[rmarkdown]{render}}
#' @rdname covrpage
#' @export 
#' @importFrom rmarkdown render
#' @importFrom git2r repository add commit push
covrpage <- function(pkg, preview = TRUE, auto_push=FALSE){
  
  testdir <- file.path(pkg,'tests')
  
  thiswd <- getwd()
  
  on.exit({
    
    if(preview){
      viewer <- create_viewer()
      if(is.null(viewer)){
        message('No viewer found in R session, aborting preview')
      }else{
        viewer('tests/README.html')
        Sys.sleep(5)  
      }
    }

    if(file.exists('tests/_covrpage.Rmd'))
      file.remove('tests/_covrpage.Rmd')
    
    if(file.exists('tests/README.html'))
      file.remove('tests/README.html')
    
    if(auto_push){
      
      repo <- git2r::repository('.')
      
      repo%>%
        git2r::add(path = c('tests/README.md'))
      
      repo%>%
        git2r::commit(message='update tests readme [skip ci]')
      
      system('git push')
      
      }
    
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
