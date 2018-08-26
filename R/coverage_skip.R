#' @export
#' @importFrom covr package_coverage
#' @importFrom testthat test_dir
coverage_skip <- function(
  test_skip = NULL,
  test_path = '../tests/testthat'){
  
  if(is.null(test_skip)){
    
    test_x <- testthat::test_dir(test_path)
    
    test_m <- map_testthat(test_path)
    
    test_x_long <- test_x%>%
      testthat_summary(type='long')
    
    test_skip <- test_x_long[test_x_long$status!='PASS',c('file','test')]
    
    test_skip$file <- gsub('#(.*?)$','',basename(test_skip$file))
    
    test_skip <- merge(test_skip,test_m)
  }
  
  test_skip_lines <- lapply(
    split(test_skip,test_skip$file),
    function(x){
      unlist(mapply(seq,from=x$line1,to=x$line2))
    }
  )
   
  if(length(test_skip_lines)>0){
    
    on.exit({
      for(nx in names(test_skip_lines)){
        FILE <- file.path(test_path,nx)
        TEST <- readLines(FILE,warn = FALSE)
        LINES <- test_skip_lines[[nx]]
        TEST[LINES] <- gsub('^#','',TEST[LINES])
        cat(TEST,file=file.path(test_path,nx),sep='\n')
      } 
    },add = TRUE)
      
      for(nx in names(test_skip_lines)){
        FILE <- file.path(test_path,nx)
        TEST <- readLines(FILE,warn = FALSE)
        LINES <- test_skip_lines[[nx]]
        TEST[LINES] <- sprintf('#%s',TEST[LINES])
        cat(TEST,file=file.path(test_path,nx),sep='\n')
      }
      
      covr::package_coverage()

  }else{
    
    covr::package_coverage()
    
  }

}
