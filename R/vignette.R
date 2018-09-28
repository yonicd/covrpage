covrpage_vignette <- function(path = '.'){
  
  tf <- tempfile(fileext = '.Rmd')
  
  on.exit(unlink(tf,force = TRUE),add = TRUE)
  
  file.copy(system.file('covrpage_vignette.Rmd',package = 'covrpage'),to = tf)
  
  LINES <- readLines('tests/README.md')[-c(1:4)]

  this_uri <- get_uri()
    
  LINES <- gsub('testthat/',sprintf('%s/tests/testthat/',this_uri),LINES)
  LINES <- gsub('../R',sprintf('%s/R',this_uri),LINES)
  
  cat(
    LINES,
    file = tf,
    sep = '\n',append = TRUE
  )
  
  invisible(file.copy(tf,file.path(path,'tests_and_coverage.Rmd'),overwrite = TRUE))
  
}


#' @title Create a vignette for covrpage 
#' @description Perform general setup and copying of tests/README.md into
#' vingettes subdirectory
#' @param path character, path to root of file, Default:'.'
#' @return NULL
#' @examples 
#' \dontrun{
#' use_covrpage_vignette()
#' }
#' @rdname use_covrpage_vignette
#' @export 
use_covrpage_vignette <- function(path = '.'){
  
  fd <- file.path(path,'DESCRIPTION')
  fv <- file.path(path,'vignettes')
  vgit <- file.path(fv,'.gitignore')
  rgit <- basename(vgit)
  
  if(!dir.exists(fv)){
    
    message(sprintf('creating %s',fv))
    
    dir.create(fv)
    
    message(sprintf('creating %s',vgit))
    
    cat(c('*.html','*.R'),sep='\n',file = vgit)
  }
  
  message(sprintf('copying tests_and_coverage.Rmd into %s',fv))
  
  covrpage_vignette(fv)
  
  if(!file.exists(rgit)){
    
    message(sprintf('creating %s',rgit))
    
    file.create(rgit)
  }
    
  if(!any(grepl('^inst/doc',readLines(rgit)))){
    
    message(sprintf('adding inst/doc to %s',rgit))
    
    cat('inst/doc',file = rgit,append = TRUE,sep='\n')
  }
 
  DESC <- read.dcf(fd,fields = c('Depends','Imports','Suggests','VignetteBuilder'))
  
  ADD_SUGG <- names(which(sapply(c('knitr','rmarkdown'),function(x) !any(grepl(x,DESC[-4])))))
    
  if(length(ADD_SUGG)>0){
    
    message(sprintf('adding %s to Suggests field in %s',paste0(ADD_SUGG,collapse = ', '),fd))
  
    if(!is.na(DESC['Suggests'])){
      NEW_SUGG <- data.frame(Suggests = c(DESC['Suggests'],ADD_SUGG))
    }else{
      NEW_SUGG <- data.frame(Suggests = ADD_SUGG)
    }
  
    write.dcf(x = data.frame(Suggests = NEW_SUGG),file=fd,append = TRUE)
    
  }
    
  if(is.na(DESC[4])){
    
    message(sprintf('adding VignetteBuilder: knitr to %s',fd))
    
    write.dcf(x = data.frame(VignetteBuilder = 'knitr'),file=fd,append = TRUE)
    
  }
  
}

#' @title covrpage for travis
#' @description wrapper for covrpage call with switches for running
#' after-success on travis and deploying gh-pages.
#' @param path character, path to package, Default: getwd()
#' @param \dots arguments to pass to covrpage
#' @return NULL
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  covrpage_ci()
#'  }
#' }
#' @rdname covrpage_ci
#' @export 
covrpage_ci <- function(path = getwd(),...){

  preview      <- FALSE
  auto_push    <- FALSE
  update_badge <- TRUE
  vignette     <- TRUE
    
  list2env(list(...),envir = environment())
  
  covrpage(path         = path,
           preview      = preview,
           update_badge = update_badge,
           vignette     = vignette
  )
  
}
