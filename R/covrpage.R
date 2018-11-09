#' @title Render covrpage
#' @description Render the template of the covrpage in the package directory.
#' @param path path to package
#' @param preview boolean, to open the output in viewer, Default: TRUE
#' @param auto_push boolean, push to remote repo on exit, Default: FALSE
#' @param update_badge boolean, locate badge in README and update with 
#' testthat results, Default: TRUE
#' @param vignette boolean, if TRUE then the covrpage README will be copied 
#' as a vignette of the package, Default: FALSE
#' @seealso
#'  \code{\link[rmarkdown]{render}}
#' @rdname covrpage
#' @export
#' @importFrom rmarkdown render
#' @importFrom git2r repository add commit push
#' @importFrom utils tail
covrpage <- function(path = getwd(), preview = TRUE, auto_push = FALSE, update_badge = TRUE, vignette = FALSE) {
  testdir <- file.path(path, "tests")

  thiswd <- getwd()

  on.exit({
    covrpage_cleanup(
      preview      = preview,
      auto_push    = auto_push,
      update_badge = update_badge,
      vignette     = vignette
      )

    setwd(thiswd)
  }, add = TRUE)

  chk_pgks <- check_for_pkgs(path)

  if (length(chk_pgks) > 0) {
    stop(sprintf(
      "The following packages must be installed: %s",
      paste0(chk_pgks, collapse = ",")
    ))
  }

  chk <- check_for_tests(testdir)

  if (chk > 0) {
    if (chk == 1) {
      stop(sprintf("tests subdirectory does not exists in: '%s'", path))
    }

    if (chk == 2) {
      stop(sprintf("tests/testthat subdirectory does contain any test files in: '%s'", path))
    }
  }

  setwd(path)

  file.copy(
    system.file("covrpage.Rmd", package = "covrpage"),
    "tests/_covrpage.Rmd"
  )

  rmarkdown::render(
    input = "tests/_covrpage.Rmd",
    output_file = "README.md",
    output_dir = "tests",
    output_format = "github_document",
    output_options = list(toc = TRUE, toc_depth = 3)
  )
}
