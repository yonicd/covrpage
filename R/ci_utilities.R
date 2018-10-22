
platform <- function(){
  
  if(.Platform[['OS.type']]=='windows'){
    'windows'
  }else{
    'unix'
  }
}

is_travis <- function(){
  identical(Sys.getenv("TRAVIS"), "true")
}

is_appveyor <- function(){
  identical(Sys.getenv("APPVEYOR"), "true")
}

is_ci <- function(){
  is_travis()|is_appveyor()
}

travis_image <- function(){
  sprintf('<a href="%s" target="_blank"><span title="Built on Travis">![](%s)</span></a>',
          Sys.getenv("TRAVIS_JOB_WEB_URL"),
          'https://github.com/yonicd/covrpage/blob/master/inst/logo/travis.png?raw=true')
}

appveyor_image <- function(){
  sprintf('<a href="%s" target="_blank"><span title="Built on Appveyor">![](%s)</span></a>',
          appveyor_build_uri(),
          'https://github.com/yonicd/covrpage/blob/master/inst/logo/appveyor.png?raw=true')
}

appveyor_build_uri <- function(){
  
  sprintf(
    'https://ci.appveyor.com/project/%s/builds/%s',
    Sys.getenv("APPVEYOR_REPO_NAME"),
    Sys.getenv("APPVEYOR_BUILD_ID")
    )
  
}

ci_img <- function(obj){
  obj$icon <- ''
  
  if(is_travis()){
    obj$icon[obj$Field=='Platform'] <- travis_image()  
  }
  
  if(is_appveyor()){
    obj$icon[obj$Field=='Platform'] <- appveyor_image()
  }
  
  names(obj)[3] <- ''
}