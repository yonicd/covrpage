#' @importFrom utils head tail
nest_test <- function(x, token_text = "^context$") {
  rx <- rownames(x)

  idx <- which(rx %in% x$parent[grepl("^SYMBOL_FUNCTION_CALL$", x$token) & grepl(token_text, x$text) & x$terminal])

  idx <- which(rx %in% x$parent[idx])

  x1 <- rep(0, nrow(x))

  x1[idx] <- 1

  x1 <- cumsum(x1)

  x2 <- split(x, x1)

  names(x2) <- sapply(x2, function(x) {
    add_text <- x$text[grep("^SYMBOL_FUNCTION_CALL$", x$token)[1]]
    ret <- eval(parse(text = x$text[grepl("^STR_CONST$", x$token)][1], keep.source = TRUE))

    if (add_text %in% c("test_that", "describe", "it")) {
      ret <- sprintf("%s: %s", add_text, ret)
    }

    ret
  })

  x2 <- lapply(x2, function(x) {
    idx <- utils::tail(utils::head(which(x$parent == 0), 2), 1)
    if (length(idx) == 0) {
      idx <- 1
    }
    x[idx:nrow(x), ]
  })

  x2
}

get_expect <- function(x, token_text = "^expect_") {
  idx <- which(grepl("^SYMBOL_FUNCTION_CALL$", x$token) & grepl(token_text, x$text) & x$terminal)

  ret <- x$text[idx]

  if (length(ret) == 0) {
    return(NULL)
  }

  line_ <- lapply(idx, function(y) {
    this_idx <- tail(grep("expr", x$token[1:y]), 2)
    this_exp <- min(grep(sprintf("%s", x$text[y]), x$text[this_idx]))
    x[this_idx[this_exp], c("line1", "line2")]
  })

  line_ <- do.call("rbind", line_)

  ret <- data.frame(
    expectation = ret,
    line1 = line_$line1,
    line2 = line_$line2,
    stringsAsFactors = FALSE
  )

  ret
}

nest_expect <- function(x) {
  ret <- lapply(x, get_expect)

  ret <- ret[!sapply(ret, is.null)]

  if (length(ret) == 0) {
    return(NULL)
  }

  ret <- lapply(names(ret), unrowname, ret = ret, label = "test")

  ret <- do.call("rbind", ret)

  ret
}

#' @title Map the hierarchy structure of a testthat test file
#' @description Query a test file to see what expectations are defined in it.
#' @param path character, path to file
#' @details Return data.frame containing which expecations are in the test file
#'  by context/description/test/expectation/linerange
#' @return data.frame
#' @seealso
#'  \code{\link[utils]{getParseData}}
#' @rdname map_test
#' @family utility
#' @export
#' @importFrom utils getParseData
map_test <- function(path) {
  x <- utils::getParseData(parse(path, keep.source = TRUE), includeText = TRUE)

  if (is.null(x)) {
    return(NULL)
  }

  ret <- lapply(nest_test(x), function(xx) {
    ret_ <- lapply(
      nest_test(xx, token_text = "^test_that$|^describe$"),
      function(y) {
        SYMB <- y$text[grep("^SYMBOL_FUNCTION_CALL$", y$token)[1]]

        switch(SYMB,
          describe = {
            nest_expect(nest_test(y, token_text = "^it$"))
          },
          test_that = {
            nest_expect(setNames(list(y), " "))
          }, {
            list()
          }
        )
      }
    )

    ret_ <- ret_[sapply(ret_, length) > 0]

    if (length(ret_) == 0) {
      return(NULL)
    }

    ret_ <- lapply(names(ret_), unrowname, ret = ret_, label = "description")

    ret_ <- do.call("rbind", ret_)

    ret_
  })

  ret <- ret[sapply(ret, length) > 0]

  if (length(ret) == 0) {
    return(NULL)
  }

  ret <- lapply(names(ret), unrowname, ret = ret, label = "context")

  ret <- do.call("rbind", ret)

  return(ret)
}

unrowname <- function(el, ret, label) {
  x <- ret[[el]]

  nc <- ncol(x)

  x[[label]] <- el

  rownames(x) <- NULL

  x <- x[, c(c(nc + 1), 1:nc)]

  return(x)
}

#' @title Map the hierarchy structure of testthat directory
#' @description Query a testthat directory for the unit test structure.
#' @param path character, path to tests, Default: 'tests/testthat'
#' @details Return data.frame containing which expecations are in the testthat directory
#'  by file/context/description/test/expectation/linerange
#' @return data.frame
#' @seealso
#'  \code{\link[stats]{setNames}}
#' @rdname map_testthat
#' @family utility
#' @export
#' @importFrom stats setNames
map_testthat <- function(path = "tests/testthat") {
  FILES <- list.files(path, full.names = TRUE, pattern = "^test(.*?)R$")

  ret <- stats::setNames(lapply(FILES, map_test), basename(FILES))

  ret <- ret[sapply(ret, length) > 0]

  if (length(ret) == 0) {
    return(NULL)
  }

  ret <- lapply(names(ret), unrowname, ret = ret, label = "file")

  ret <- do.call("rbind", ret)

  idx <- !(ret$test == " ")

  ret$description <- gsub("describe: |test_that: ", "", ret$description)
  ret$test <- gsub("it: ", "", ret$test)

  ret$test[!idx] <- ret$description[!idx]

  ret$test[idx] <- sprintf("%s: %s", ret$description[idx], ret$test[idx])

  ret$description <- NULL

  ret
}
