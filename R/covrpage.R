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
covrpage <- function(path = getwd(), preview = TRUE, auto_push=FALSE, update_badge = TRUE, vignette = FALSE) {
  testdir <- file.path(path, "tests")

  thiswd <- getwd()

  on.exit({
    if (preview) {
      viewer <- create_viewer()
      if (is.null(viewer)) {
        message("No viewer found in R session, aborting preview")
      } else {
        viewer("tests/README.html")
        Sys.sleep(5)
      }
    }

    if(update_badge){
      if(check_badge()){
      
      status <- gsub('Final Status : ',
                     '',
                     utils::tail(readLines('tests/README.md'),1)
                     )
      
      README <- find_readme()
      
      README_LINES <- readLines(README)
      
      cat(gsub('covrpage-(.*?)svg', 
               badge_covrpage(status),
               README_LINES),
          sep = '\n',
          file = README)
      
      if(grepl('RMD$',README,ignore.case = TRUE)){
        rmarkdown::render(
          input = 'README.Rmd',
          output_format = 'github_document',
          output_file = 'README.md',
          run_pandoc = FALSE,
          quiet = TRUE
          )
      }
    }
    }
    
    if(vignette){
      use_covrpage_vignette()
    }
    
    if (file.exists("tests/_covrpage.Rmd")) {
      file.remove("tests/_covrpage.Rmd")
    }

    if (file.exists("tests/README.html")) {
      file.remove("tests/README.html")
    }

    if (auto_push) {
      repo <- git2r::repository(".")

      repo %>%
        git2r::add(path = c("tests/README.md"))

      repo %>%
        git2r::commit(message = "update tests readme [skip ci]")

      system("git push")
    }

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
