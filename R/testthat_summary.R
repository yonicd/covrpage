testthat_sum_short <- function(x) {
  
  if(length(x)==0)
    return(NULL)
  
  x1 <- data.frame(x, stringsAsFactors = FALSE)

  x1 <- x1[, c("file", "nb", "real", "failed", "skipped", "error", "warning")]

  names(x1)[c(2, 3)] <- c("n", "time")

  for (i in names(x1)[-1])
    x1[[i]] <- as.numeric(x1[[i]])

  ret <- do.call("rbind", lapply(split(x1, x1$file), sum_func))
  
  ret <- emo_result(ret,'FAILED', type='short')
  ret <- emo_result(ret,'SKIPPED',type='short')
  ret <- emo_result(ret,'WARNING',type='short')
  
  rownames(ret) <- NULL

  ret
  
}

testthat_sum_long <- function(x) {
  
  if(length(x)==0)
    return(NULL)
  
  x1 <- data.frame(x, stringsAsFactors = FALSE)

  for (i in seq(1:ncol(x1)))
    if (is.logical(x1[[i]])) {
      x1[[i]] <- as.numeric(x1[[i]])
    }

  x1$pass <- as.numeric((apply(x1[, c("failed", "skipped", "warning", "error")], 1, sum)) == 0)

  x1$status <- NA

  for (i in 1:nrow(x1)) {
    if (x1$pass[i] == 1) {
      x1$status[i] <- "PASS"
    }

    if (x1$failed[i] != 0) {
      x1$status[i] <- "FAILED"
    }

    if (x1$error[i] != 0) {
      x1$status[i] <- "ERROR"
    }

    if (x1$skipped[i] != 0) {
      x1$status[i] <- "SKIPPED"
    }

    if (x1$warning[i] != 0) {
      x1$status[i] <- "WARNING"
    }
  }

  ret <- x1[, c("file", "context", "test", "status", "nb", "real")]

  names(ret)[c(5, 6)] <- c("n", "time")

  lines <- sapply(x, function(x) {
    ret <- sprintf("L%s", unique(c(x$results[[1]]$src[1], x$results[[1]]$src[3])))
    paste0(ret, collapse = "_")
  })

  ret$file <- sprintf("[%s](testthat/%s#%s)", ret$file, ret$file, lines)

  ret <- emo_result(ret,'FAILED',type='long')
  ret <- emo_result(ret,'SKIPPED',type='long')
  ret <- emo_result(ret,'WARNING',type='long')

  ret
  
}

emo_result <- function(dat,status,type = 'short'){
  
  if(type=='short'){
    idx <- dat[[tolower(status)]]>0
  }
  
  if(type=='long'){
    idx <- dat$status==status
  }
    
  if(any(idx)){
      
    if(!'icon'%in%names(dat)){
      dat[['icon']] <- ''
    }
    
    dat$icon[idx] <- paste0(dat$icon[idx],emos[[platform()]][[status]])
  }
  
  dat
  
}
