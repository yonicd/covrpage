#' @title Create covrpages for pacakges on Github
#' @description Preview covrpages for R package repositories on Github
#' @param repo character, user/repo
#' @param ... arguments to pass to coverpage
#' @details This function only works for public repositories.
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  covrpage_snapshot(repo = 'hrbrmstr/slackr')
#'  }
#' }
#' @rdname covrpage_snapshot
#' @export 
#' @importFrom utils download.file unzip
covrpage_snapshot <- function(repo,...){
  
  repo_url <- sprintf('https://github.com/%s/archive/master.zip',repo)
  
  td <- file.path(tempdir(),'covrpage')

  dir.create(td)
  
  utils::download.file(url = repo_url,file.path(td,'thisrepo.zip'))
  
  utils::unzip(file.path(td,'thisrepo.zip'),
               exdir = file.path(td,'thisrepo'))
  
  on.exit({
    unlink(td,recursive = TRUE,force = TRUE)
    if(!preview)
      return(NULL)
    },add = TRUE)
  
  thiswd <- getwd()
  
  new_dir <- list.files(file.path(td,'thisrepo'),recursive = FALSE,full.names = TRUE)
  
  setwd(new_dir)
  
  l <- list(...)
  
  list2env(l,envir = environment())
  
  if(!exists('preview'))
    preview <- TRUE

  covrpage('.',preview = preview)
  
  setwd(thiswd)
  
}
