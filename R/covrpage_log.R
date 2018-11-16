#' @title Query 'git log' for covrpage history
#' @description Retrieve log of covrpage README.md files committed to git
#' version control
#' @return list
#' @examples
#' \dontrun{
#' covrpage_log()
#' }
#' @rdname covrpage_log
#' @family log
#' @export

covrpage_log <- function() {
  x <- system('git log --pretty=format:"%h" -- tests/README.md', intern = TRUE)
  lapply(x, function(hash) system(sprintf("git cat-file -p %s:tests/README.md", hash), intern = TRUE))
}

#' @title Query 'git log' for code coverage history
#' @description Retrieve log of code coverages evaluated by covrpage that
#' were committed to git version control.
#' @return data.frame
#' @examples
#' \dontrun{
#' covr_log()
#' }
#' @rdname covr_log
#' @family log
#' @export

covr_log <- function() {
  do.call(rbind, lapply(covrpage_log(), covr_md_df))
}


covr_md_df <- function(md) {
  date <- strptime(md[3], format = "%d %B,%Y %H:%M:%S")
  if (length(grep("^\\| Object", md)) == 0) {
    return(NULL)
  }
  covr_table <- md[(grep("^\\| Object", md) + 2):(grep("^<br>$", md) - 2)]
  covr_table <- gsub("^\\||\\|$|\\s", "", covr_table)
  covr_table <- strsplit(covr_table, "\\|")
  covr_table_name <- basename(gsub(
    pattern = "^(.*?)\\(|\\)$",
    replacement = "",
    sapply(covr_table, "[", 1)
  ))
  covr_table_percent <- as.numeric(sapply(covr_table, "[", 2))
  ret <- data.frame(
    date = date,
    file = covr_table_name,
    percent = covr_table_percent,
    stringsAsFactors = FALSE
  )
  ret <- ret[!is.na(covr_table_percent), ]
  ret$file[1] <- sprintf("%s (Package)", ret$file[1])
  ret
}
