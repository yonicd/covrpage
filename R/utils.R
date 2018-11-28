package_name <- function(path=getwd()){
  desc_path <- normalizePath(file.path(path,'DESCRIPTION'),mustWork = TRUE)
  read.dcf(desc_path)[,'Package'][[1]]
}
