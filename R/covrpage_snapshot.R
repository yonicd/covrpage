#' @title Run covrpage on a GitHub Repository
#' @description Runs a covrpage on a GitHub repository in a sterile environment
#' @param repo character, Public GitHub repository
#' @param branch character, Name of the branch to checkout. Default: NULL
#' @param PAT character, GitHub Personal Access Token, Default: Sys.getenv("GITHUB_PAT")
#' @param host character, GitHub API host to use, Default: "api.github.com"
#' @param preview boolean, to open the output in viewer, Default: TRUE
#' @return NULL
#' @details 
#'  
#' Creates a markdown output that is sent to the internal viewer.
#' 
#' Setting branch to NULL means that \code{\link[git2r]{clone}} will use the remote's default branch.
#' 
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  covrpage_snapshot('tidyverse/purrr')
#'  }
#' }
#' @seealso
#'  \code{\link[covrpage]{covrpage}} \code{\link[git2r]{clone}} \code{\link[remotes]{install_github}}
#' @rdname covrpage_snapshot
#' @family invoke
#' @export 
#' @importFrom withr with_dir with_temp_libpaths
#' @importFrom git2r clone
#' @importFrom remotes install_github
covrpage_snapshot <- function(repo,
                              branch = NULL,
                              PAT = Sys.getenv("GITHUB_PAT"),
                              host = "api.github.com",
                              preview = TRUE
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
    invisible(RET)
  },
  add = TRUE)
  
  withr::with_dir(td,{
    
    git2r::clone(
      url         = sprintf('https://github.com/%s.git',repo),
      local_path  = file.path(td,basename(repo)),
      branch      = branch,
      credentials = git2r::cred_token(PAT)
    )
    
    withr::with_temp_libpaths({
      
      remotes::install_github(
        repo = repo,
        host = host
      )
      
      setwd(basename(repo))
      
      covrpage(
        update_badge = FALSE,
        preview      = preview
      )
    })
    
    RET <- TRUE
  })

}
