sprea <- function(x) {
  rhs <- x[1, c(1, 3, 4)]
  lhs <- x[[5]]
  names(lhs) <- x[[2]]
  lhs <- data.frame(t(lhs))
  data.frame(cbind(rhs, lhs), stringsAsFactors = FALSE)
}

gath <- function(i, x) {
  y <- x[, c(1:3, i)]
  nm <- names(y)[ncol(y)]
  y$status_type <- nm
  y$status <- y[[nm]]
  y <- y[, -4]
  y
}

sum_func <- function(x) {
  x <- do.call("rbind", lapply(4:7, gath, x))
  
  x <- data.frame(stats::aggregate(.~file + status_type, x, sum), stringsAsFactors = FALSE)
  
  x <- sprea(x)
  
  x$file <- sprintf("[%s](testthat/%s)", x$file, x$file)
  
  x
}

enfram <- function(x,name = 'name',value = 'value'){
  nm <- names(x)
  names(x) <- NULL
  ret <- data.frame(name = nm,value = x, stringsAsFactors = FALSE)
  names(ret) <- c(name,value)
  ret
}
