#' @importFrom utils head tail
nest_test <- function(x,token_text = '^context$'){

  rx <- rownames(x)
    
  idx <- which(rx%in%x$parent[grepl('^SYMBOL_FUNCTION_CALL$',x$token)&grepl(token_text,x$text)&x$terminal])-1

  x1 <- rep(0,nrow(x))
  
  x1[idx] <- 1
  
  x1 <- cumsum(x1)

  x2 <- split(x,x1)
  
  names(x2) <- sapply(x2,function(x) eval(parse(text = x$text[grepl('^STR_CONST$',x$token)][1])))  
  
  x2 <- lapply(x2,function(x){
    
    idx <- utils::tail(utils::head(which(x$parent==0),2),1)
    if(length(idx)==0)
      idx <- 1
    x[idx:nrow(x),]
  })
  
  x2
}

get_expect <- function(x,token_text = '^expect_'){
  ret <- x$text[which(grepl('^SYMBOL_FUNCTION_CALL$',x$token)&grepl(token_text,x$text)&x$terminal)]
  
  if(length(ret)==0)
    ret <- NULL
  
  ret
  
}

nest_expect <- function(x){
  ret <- lapply(x,get_expect) 
  ret[!sapply(ret,is.null)]
}

#' @title map a single test file
#' @description return nested list of context/test/excpectation in testthat R file
#' @param path character, path to file
#' @return list
#' @seealso 
#'  \code{\link[utils]{getParseData}}
#' @rdname map_test
#' @export 
#' @importFrom utils getParseData
map_test <- function(path){
  
  x <- utils::getParseData(parse(path),includeText = TRUE)
  
  ret <- lapply(nest_test(x),function(xx){
    nest_expect(nest_test(xx,token_text = '^test_that$'))
    }) 
  
  ret <- ret[sapply(ret,length)>0]
  
  return(ret)
}

#' @title Heirarchy structure of testthat tests
#' @description return nested list of context/test/excpectation in testthat directory
#' @param path character, path to tests, Default: 'tests/testthat'
#' @return list
#' @seealso 
#'  \code{\link[stats]{setNames}}
#' @rdname map_testthat
#' @export 
#' @importFrom stats setNames
map_testthat <- function(path = 'tests/testthat'){

  FILES <- list.files(path,full.names = TRUE,pattern = '^test(.*?)R$')

  ret <- stats::setNames(lapply(FILES,map_test),basename(FILES))
  
  ret
  
}
