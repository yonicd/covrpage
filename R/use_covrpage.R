#' @title Add covrpage to Travis CI for a git directory
#' @description Adds bash file to execute after Travis test is successfully completed.
#' @param file character, file path to save bash script to, Default: '.travis/covrpage.sh'
#' @param gh_user character, Github user name, 
#' Default: gsub("@(.*?)$", "", system("git config user.email", intern = TRUE))
#' @param push_branch character, branch Travis will create to push updated covrpage readme file, Default: 'test'
#' @param repo character, name of git repo that package is hosted on, Default: system("git config travis.slug", intern = TRUE)
#' @param deploy_branch character, name of branch that current package build is located, 
#' Default: system("git rev-parse --abbrev-ref HEAD", intern = TRUE) (usually 'master')
#' @rdname use_covrpage
#' @export 

use_covrpage <- function(file = '.travis/covrpage.sh',
                         gh_user = gsub('@(.*?)$','',system('git config user.email',intern = TRUE)),
                         push_branch = 'test',
                         repo = system('git config travis.slug',intern = TRUE),
                         deploy_branch = system('git rev-parse --abbrev-ref HEAD',intern = TRUE)){
  
  cmd <- "covrpage::covrpage(pkg = '.',preview = FALSE)"
  
  base_text <- '#!/bin/bash
  
  set -x
  if [ $TRAVIS_BRANCH == "%s" ] ; then
  
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  
  git checkout -b %s
  
  Rscript -e "devtools::install() ; %s"
  
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER [skip ci]"
  
  git remote add deploy https://%s:${GH_PAT}@github.com/%s.git
  git push -f deploy %s -v
  
  else
  echo "Not deploying, since this branch is not %s."
  fi
  
}
'
  
  s_pr <- sprintf(base_text,deploy_branch, push_branch, cmd, gh_user, repo, push_branch, deploy_branch)
  
  
if(is.null(file)){
  
    writeLines(s_pr)
  
    invisible(s_pr)
  
  }else{
    if(!dir.exists(dirname(file))){
      message('Creating .travis directory')
      dir.create(basename(file))
    }
    
    message('Writing covrpage.sh bash script to .travis')  
    cat(s_pr,sep='\n',file=file)
    
message(sprintf("Add to .travs.yml 

  r_github_packages: yonicd/covrpage 
  after_sucess: 
  - Rscript -e 'covr::codecov()'
  - bash %s

Use Travis CLI to encrypt GH_PAT global variable with a GITHUB Personal Access Token

travis_encrypt(r_obj = Sys.getenv('GITHUB_PAT'),travis_env = 'GH_PAT')",file))
    
  }
  
}
