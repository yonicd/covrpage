#' @importFrom gert git_add git_commit git_push
covrpage_cleanup <- function(
                             preview = TRUE,
                             auto_push = FALSE,
                             update_badge = TRUE,
                             vignette = FALSE) {
  if (preview) {
    viewer <- create_viewer()

    if (is.null(viewer)) {
      message("No viewer found in R session, aborting preview")
    } else {
      if (file.exists("tests/README.html")) {
        viewer("tests/README.html")
        Sys.sleep(5)
      }
    }
  }

  if (update_badge) {
    if (check_badge()) {
      status <- gsub(
        "Final Status : ",
        "",
        utils::tail(readLines("tests/README.md"), 1)
      )

      README <- find_readme()

      README_LINES <- readLines(README)

      README_LINE <- grep("covrpage-(.*?)svg", README_LINES)[1]

      README_LINES[README_LINE] <- gsub("covrpage-(.*?)svg", badge_covrpage(status), README_LINES[README_LINE])

      cat(README_LINES,
        sep = "\n",
        file = README
      )

      if (grepl("RMD$", README, ignore.case = TRUE)) {
        rmarkdown::render(
          input = "README.Rmd",
          output_format = "github_document",
          output_file = "README.md",
          quiet = FALSE
        )
        Sys.sleep(1)
        unlink("README.html")
      }
    }
  }

  if (vignette) {
    use_covrpage_vignette()
  }

  if (file.exists("tests/_covrpage.Rmd")) {
    file.remove("tests/_covrpage.Rmd")
  }

  if (file.exists("tests/README.html")) {
    file.remove("tests/README.html")
  }

  if (auto_push) {
    gert::git_add("tests/README.md")
    gert::git_commit(message = "update tests readme [skip ci]")
    gert::git_push()
  }
}
