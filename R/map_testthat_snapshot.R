#' @title Run map_testthat on a GitHub Repository
#' @description Runs a covrpage on a GitHub repository in a sterile environment
#' @param repo character, Public GitHub repository
#' @param branch character, Name of the branch to checkout. Default: NULL
#' @param host character, GitHub API host to use, Default: "api.github.com"
#' @return tibble
#' @details 
#'  
#' Creates a markdown output that is sent to the internal viewer.
#' 
#' Setting branch to NULL means that \code{\link[gert]{git_clone}} will use the remote's default branch.
#' 
#' @examples
#' \dontrun{
#' if(interactive()){
#'  map_testthat_snapshot('tidyverse/purrr')
#'  }
#' }
#' @seealso
#'  \code{\link[covrpage]{covrpage}} \code{\link[gert]{git_clone}} \code{\link[remotes]{install_github}}
#' @rdname map_testthat_snapshot
#' @family utility
#' @export 
#' @importFrom withr with_dir with_temp_libpaths
#' @importFrom gert git_clone
#' @importFrom remotes install_github
map_testthat_snapshot <- function(repo,
                              branch = NULL,
                              host = "api.github.com"
){
  
  RET <- FALSE
  
  td <- file.path(tempdir(),'snapshot')
  
  dir.create(
    path      = td,
    recursive = TRUE
  )
  
  on.exit({
    unlink(
      x         = td,
      recursive = TRUE,
      force     = TRUE
    )
  },
  add = TRUE)
  
  withr::with_dir(td,{
    
    gert::git_clone(
      url    = sprintf('https://github.com/%s.git', repo),
      path   = file.path(td, basename(repo)),
      branch = branch
    )
    
    setwd(basename(repo))
    check_for_tests('tests')
    RET <- map_testthat()
  })
  
  RET
}
