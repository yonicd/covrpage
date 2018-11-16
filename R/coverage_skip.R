#' @title Run covr with failing tests
#' @description Run \code{\link[covr]{package_coverage}} ignoring failing tests from \code{\link[testthat]{test_dir}}.
#' @param test_path character, path to test directory, Default: 'tests/testthat'
#' @param test_skip data.frame, mapping of failing tests, PARAM_DESCRIPTION, Default: NULL
#' @return NULL
#' @details If test_skip is NULL then a new test_dir will be run internally checking
#' for failing tests.
#' @seealso
#'  \code{\link[testthat]{test_dir}}
#'  \code{\link[covr]{package_coverage}}
#' @rdname coverage_skip
#' @family utility
#' @export
#' @importFrom testthat test_dir
#' @importFrom covr package_coverage
coverage_skip <- function(
                          test_path = "tests/testthat",
                          test_skip = NULL) {
  if (is.null(test_skip)) {
    test_x <- testthat::test_dir(path = test_path)

    test_m <- map_testthat(test_path)

    test_x_long <- test_x %>%
      testthat_summary(type = "long")

    test_skip <- test_x_long[test_x_long$status != "PASS", c("file", "test")]

    test_skip$file <- gsub("#(.*?)$", "", basename(test_skip$file))

    test_skip <- merge(test_skip, test_m)
  }

  test_skip_lines <- lapply(
    split(test_skip, test_skip$file),
    function(x) {
      unlist(mapply(seq, from = x$line1, to = x$line2))
    }
  )

  if (length(test_skip_lines) > 0) {
    on.exit({
      for (nx in names(test_skip_lines)) {
        FILE <- file.path(test_path, nx)
        TEST <- readLines(FILE, warn = FALSE)
        LINES <- test_skip_lines[[nx]]
        TEST[LINES] <- gsub("^#", "", TEST[LINES])
        cat(TEST, file = file.path(test_path, nx), sep = "\n")
      }
    }, add = TRUE)

    for (nx in names(test_skip_lines)) {
      FILE <- file.path(test_path, nx)
      TEST <- readLines(FILE, warn = FALSE)
      LINES <- test_skip_lines[[nx]]
      TEST[LINES] <- sprintf("#%s", TEST[LINES])
      cat(TEST, file = file.path(test_path, nx), sep = "\n")
    }

    covr::package_coverage()
  } else {
    covr::package_coverage()
  }
}
