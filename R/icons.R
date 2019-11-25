build_icon <- function(sinfo){

  icon <- NULL
  
  if (is_travis()) {

    icon <- travis_icon()
    
  }
  
  if (is_gh()) {
    
    icon <- gh_icon()
    
  }  

  if(!is.null(icon)){
    sinfo$Icon <- ""
    sinfo$Icon[sinfo$Field == "Platform"] <- icon
    names(sinfo)[3] <- ""  
  }
  
  sinfo
}


travis_icon <- function() {
  sprintf(
    '<a href="%s" target="_blank"><span title="Built on Travis">![](%s)</span></a>',
    Sys.getenv("TRAVIS_JOB_WEB_URL"),
    "https://github.com/metrumresearchgroup/covrpage/blob/master/inst/logo/travis.png?raw=true"
  )
}

gh_icon <- function() {
  
  ACTIONS_JOB_WEB_URL <- sprintf('https://github.com/%s/commit/%s/checks?check_suite_id=%s',
              Sys.getenv('GITHUB_REPOSITORY'),
              system('git rev-parse HEAD',intern = TRUE),
              Sys.getenv('GITHUB_ACTION')
            )
  
  sprintf(
    '<a href="%s" target="_blank"><span title="Built on Github Actions">![](%s)</span></a>',
    ACTIONS_JOB_WEB_URL,
    "https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true"
  )
  
}