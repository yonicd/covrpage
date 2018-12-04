#' @title Run covrpage on a GitHub Repository
#' @description Runs a covrpage on a GitHub repository in a sterile environment
#' @param repo character, Public GitHub repository
#' @return NULL
#' @details Creates a markdown output that is sent to the internal viewer.
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  covrpage_snapshot('tidyverse/purrr')
#'  }
#' }
#' @rdname covrpage_snapshot
#' @export 
#' @importFrom withr with_dir with_temp_libpaths
#' @importFrom git2r clone
#' @importFrom remotes install_github
covrpage_snapshot <- function(repo){
  
  td <- file.path(tempdir(),'snapshot')
  dir.create(td,recursive = TRUE)
  on.exit(unlink(td,recursive = TRUE,force = TRUE),add = TRUE)
  
  withr::with_dir(td,{
    
    git2r::clone(
      url        = sprintf('https://github.com/%s.git',repo),
      local_path = file.path(td,basename(repo))
    )
    
    withr::with_temp_libpaths({
      remotes::install_github(repo)
    })
    
    setwd(basename(repo))
    covrpage(update_badge = FALSE)
  })

}
