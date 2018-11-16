#' @title Encrypt Travis environment variables
#' @description Add encrypted Travis environment variable to git directory and .travis.yml.
#' @param r_obj object value to encrypt
#' @param travis_env character, name of Travis environment variable
#' @param add boolean, add directly to .travis.yml, Default: TRUE
#' @rdname tencrypt
#' @family setup
#' @export
tencrypt <- function(r_obj = Sys.getenv("GITHUB_PAT"),
                     travis_env = "GITHUB_PAT",
                     add = TRUE) {
  try(x <- system("travis --version", intern = TRUE), silent = TRUE)

  if (class(x) == "try-error") {
    stop("Travis CLI not installed")
  }

  if (add) {
    add_str <- " --add"
  } else {
    add_str <- ""
  }

  s <- sprintf(
    "travis encrypt %s=%s %s",
    travis_env,
    r_obj,
    add_str
  )

  system(s, intern = TRUE)
}
