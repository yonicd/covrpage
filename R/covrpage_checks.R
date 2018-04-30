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