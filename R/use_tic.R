use_tic <- function(path = getwd()){
  
  if(!c('travis')%in%rownames(installed.packages())){
    message("To use tic with covrpage you must first install 'ropenscilabs/travis' from GitHub")
    return(invisible(NULL))
  }

  ans <- utils::menu(
    choices = c('No','Yes'),
    title   = 'Have you run travis::use_tic()?'
  )

  if(ans<2){
    return(invisible(NULL))
  }

  message('The files tic.R and .travis.yml will be used together to run covrpage on Travis')
  message('after a successful installation of the target package.')
  message('The output of covrpage tests/README.md will be deployed back into the originating branch.')
  
  ans <- utils::menu(
    choices = c('Yes','No'),
    title   = sprintf('Copy covrpage templated tic.R to %s/tic.R?',normalizePath(path))
    )
  
  if(ans==1){
    file.copy(
      system.file('templates/tic/tic.R',package = 'covrpage'),
      file.path(path,'tic.R'),
      overwrite = TRUE
    )
  }
  
  ans <- utils::menu(
    choices = c('No','Yes'),
    title   = sprintf('Copy covrpage tic templated .travis.yml to %s/.travis.yml?',
                      normalizePath(path))
  )
  
  if(ans==2){
    file.copy(
      system.file('templates/tic/tic_travis.yml',package = 'covrpage'),
      file.path(path,'.travis.yml'),
      overwrite = TRUE
    )
  }
  
}