#' @title Summary outputs for testthat object
#' @description Summary outputs for testthat object that is used in rmd
#' @param x list, testthat object output
#' @param type character, format of the object output, Default: c("short", "long")
#' @return data.frame
#' @rdname testthat_summary
#' @export

testthat_summary <- function(x, type=c("short", "long")) {
  switch(type,
    "short" = testthat_sum_short(x),
    "long" = testthat_sum_long(x)
  )
}

#' @importFrom covr percent_coverage tally_coverage
covr_print_to_df <- function(x, group = c("filename", "functions"), by = "line") {
  if (length(x) == 0) {
    return()
  }

  group <- match.arg(group)

  type <- attr(x, "type")

  if (is.null(type) || type == "none") {
    type <- NULL
  }

  df <- covr::tally_coverage(x, by = by)

  if (!NROW(df)) {
    return(invisible())
  }

  percents <- tapply(df$value, df[[group]], FUN = function(x) (sum(x > 0) / length(x)) * 100)

  overall_percentage <- covr::percent_coverage(df, by = by)

  names(overall_percentage) <- attr(x, "package")$package

  by_coverage <- percents[order(percents, names(percents))]

  ret <- c(overall_percentage, by_coverage)

  ret <- data.frame(name = names(ret), value = ret, stringsAsFactors = FALSE, row.names = NULL)

  return(ret)
}

#' @title Summary outputs for covr object
#' @description Creates a summary data.frame for covr object output that
#' mimics the console print method of \code{\link[covr]{package_coverage}}
#' @param x covr object
#' @param failed flag for failed test, Default: FALSE
#' @return data.frame
#' @seealso
#'  \code{\link[covr]{package_coverage}}
#' @rdname covr_summary
#' @export
covr_summary <- function(x,failed = FALSE) {
  
  ret <- covr_print_to_df(x)

  ret$name <- ifelse(grepl("^R/", ret$name),
    sprintf("[%s](../%s)", ret$name, ret$name),
    ret$name
  )

  if(failed){
    ret$name[1] <- sprintf('%s \U0001f534',ret$name[1])
  }
  
  return(ret)
}
