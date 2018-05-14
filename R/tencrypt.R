#' @title encrypt travis environment variables
#' @description add encrypted travis environment variable to git directory and .travis.yml.
#' @param r_obj object value to encrypt
#' @param travis_env character, name of travis environment variable
#' @param add boolean, add directly to .travis.yml, Default: TRUE
#' @rdname tencrypt
#' @export 
tencrypt <- function(r_obj = Sys.getenv('GITHUB_PAT'),
                           travis_env = 'GH_PAT', 
                           add = TRUE){
  
  try(x <- system('travis --version',intern = TRUE),silent = TRUE)
  
  if(class(x)=="try-error")
    stop('travis cli not installed')
  
  if(add){
    add_str  <- ' --add'    
  }else{
    add_str <-''  
  }
  
  s <- sprintf("travis encrypt %s = '%s' %s",
               travis_env,
               r_obj, 
               add_str)
  
  system(s,intern = TRUE)
  
}