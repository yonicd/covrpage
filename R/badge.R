badge_covrpage <- function(status = 'pass'){
  
  uri_colour <-switch(status,
                      '<!--- error/failed --->' = 'red',
                      '<!--- skipped/warning --->' = 'yellowgreen',
                      'brightgreen'
  )
  
  uri_date <- strftime(Sys.Date(),'%Y_%m_%d')  
  
  sprintf('covrpage-Last_Build_%s-%s.svg', uri_date, uri_colour)
  
}

test_to_badge <-function(obj){
  
  x <- apply(obj[,c('error','failed','skipped','warning')],2,sum)>0
  
  status <- 'pass'
  
  if(x[['skipped']]||x[['warning']])
    status <- 'skipped/warning'
  
  if(x[['error']]||x[['failed']])
    status <- 'error/failed'
  
  status
}

test_details <- function(obj){
  
  if(test_to_badge(obj)=='pass'){
    'closed'
  }else{
    'open'
  }

}

find_readme <- function(ROOT = '.', use_rmd = TRUE){
  
  ROOT <- normalizePath(ROOT)
  
  README <- list.files(ROOT,pattern = 'README',full.names = TRUE)
  
  if(length(README)==0){
    return(FALSE)
  }
  
  if(use_rmd){
    use_rmd <- any(grepl('README.RMD$',README,ignore.case = TRUE))
  }
  
  ext <- ifelse(use_rmd,'RMD','MD')
  
  README <- README[grep(sprintf('README.%s',ext),toupper(README))]
  
  README
}

check_badge <- function(){
  
  README <- find_readme()
  
  if(is.logical(README))
    return(FALSE)
  
  README_LINES <- readLines(README,warn = FALSE)
  
  any(grepl('badge/covrpage-',README_LINES))
}


#' @title Create covrpage Badge
#' @description Create covrpage badge for test status and date that is connected to
#' the README.md created in the tests directory.
#' @param remote_origin character, username/repo of the remote origin, Default: NULL
#' @param active_branch characer, current active git branch, Default: NULL
#' @return character
#' @details if either inputs are NULL then the .git file is inspected to gather the 
#' information
#' @rdname make_badge
#' @export 

make_badge <- function(remote_origin = NULL, active_branch = NULL){
  
 if(is.null(active_branch))
  active_branch <- system('git rev-parse --abbrev-ref HEAD',intern = TRUE)

 if(is.null(remote_origin)){
   remote_origin <- system('git config --get remote.origin.url',intern = TRUE)
   
   remote_origin <- gsub('^(.*?)\\.com(:|/)|\\.git$', '', remote_origin) 
 }

 uri <- sprintf('https://github.com/%s/tree/%s/tests/README.md',remote_origin,active_branch)

 sprintf('[![Covrpage Summary](https://img.shields.io/badge/covrpage-Initialized-orange.svg)](%s)',
         tiny(uri))
}

# is_git <- function(){
#   system('git rev-parse --is-inside-work-tree',intern = TRUE)=='true'
# }

#' @importFrom curl nslookup curl
tiny <- function(uri){

  host <- 'tinyurl.com'
  
  if(!is.null(curl::nslookup(host, error = FALSE))){
    
    base <- sprintf('http://%s/api-create.php',host)
    
    x <- curl::curl(sprintf('%s?url=%s',base,uri))  
    
    on.exit(close(x),add = TRUE)
    
    uri_raw <- uri
    
    uri <- readLines(x,warn = FALSE)
    
    message(sprintf('masking %s with %s',uri_raw,uri))
    
  }
  
  uri
  
}
