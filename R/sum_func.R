sprea <- function(x){
  
  rhs <- x[1,c(1,3,4)]
  lhs <- x[[5]]
  names(lhs) <- x[[2]]
  lhs <- data.frame(t(lhs))
  data.frame(cbind(rhs,lhs),stringsAsFactors = FALSE)
  
}

gath <- function(i,x){
  y <- x[,c(1:3,i)] 
  nm <- names(y)[ncol(y)]
  y$status_type <- nm
  y$status <- y[[nm]]
  y <- y[,-4]
  y
}

sum_func <- function(x){
  
  x <- do.call('rbind',lapply(4:7,gath,x))
  
  x <- data.frame(stats::aggregate(.~file+status_type,x,sum),stringsAsFactors = FALSE)
  
  x <- sprea(x)
  
  x$file <- sprintf('[%s](testthat/%s)',x$file,x$file)
  
  x
}

sum_func_short <- function(x){
  
x1 <- x[,c('file','nb','real','failed','skipped','error','warning')]

names(x1)[c(2,3)] <- c('n','time')

for(i in names(x1)[-1])
  x1[[i]] <- as.numeric(x1[[i]])

  do.call('rbind',lapply(split(x1,x1$file),sum_func))
}

sum_func_long <- function(x){
  
  x1 <- x
  
  for(i in seq(1:ncol(x1)))
    if(is.logical(x1[[i]]))
      x1[[i]] <- as.numeric(x1[[i]]) 
    
    x1$pass <- as.numeric((apply(x1[,c('failed','skipped','warning','error')],1,sum))==0)
    
    x1$status <- NA
    
    for(i in 1:nrow(x1)){
      
      if(x1$pass[i]==1) 
        x1$status[i] <- 'PASS'
      
      if(x1$failed[i]==1) 
        x1$status[i] <- 'FAILED'
      
      if(x1$error[i]==1) 
        x1$status[i] <- 'ERROR'
      
      if(x1$skipped[i]==1) 
        x1$status[i] <- 'SKIPPED'
      
      if(x1$warning[i]==1) 
        x1$status[i] <- 'WARNING'}
    
    ret <- x1[,c('file','test','context','status','nb','real')]
    
    names(ret)[c(5,6)] <- c('n','time')
    
    ret$file <- sprintf('[%s](testthat/%s)',ret$file,ret$file)
    
    ret
    
}

#' @title re-export magrittr pipe operators
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL