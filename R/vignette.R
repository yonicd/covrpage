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
#' @family setup
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
 
  DESC <- read.dcf(fd)
  
  ADD_SUGG <- names(which(sapply(c('knitr','rmarkdown'),function(x){
    
    idx <- match(c('Depends','Imports','Suggests'),colnames(DESC))
    
    THIS_DESC <- DESC[,idx]

    !any(grepl(x,THIS_DESC))
  })))
    
  if(length(ADD_SUGG)>0){
    
    ADD_SUGG <- paste0(ADD_SUGG,collapse = ',')
    
    message(sprintf('adding %s to Suggests field in %s',paste0(ADD_SUGG,collapse = ', '),fd))
  
    if(any(grepl('Suggests',colnames(DESC)))){
      NEW_SUGG <- sprintf('%s,%s',DESC[,'Suggests'],ADD_SUGG)
      
    }else{
      
      NEW_SUGG <- ADD_SUGG
      
      NEW_MAT <- matrix(NA,1)
      
      colnames(NEW_MAT) <- 'Suggests'
      
      DESC <- cbind(DESC,NEW_MAT)
      
    }
  
    DESC[,'Suggests'] <- NEW_SUGG
    
    write.dcf(x = DESC, file = fd)
    
  }
    
  if(!any(grepl('VignetteBuilder',colnames(DESC)))){
    
    message(sprintf('adding VignetteBuilder: knitr to %s',fd))
    
    write.dcf(x = data.frame(VignetteBuilder = 'knitr'),file=fd,append = TRUE)
    
  }
  
}
