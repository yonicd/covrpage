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
#' @family invoke
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
