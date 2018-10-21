
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

travis_image <- function(){
  sprintf('<a href="%s" target="_blank"><span title="Built on Travis">![](%s)</span></a>',
          Sys.getenv("TRAVIS_JOB_WEB_URL"),
          'https://github.com/yonicd/covrpage/blob/master/inst/logo/travis.png?raw=true')
}

appveyor_image <- function(){
  sprintf('<a href="%s" target="_blank"><span title="Built on Appveyor">![](%s)</span></a>',
          Sys.getenv("APPVEYOR_JOB_WEB_URL"),
          'https://github.com/yonicd/covrpage/blob/master/inst/logo/appveyor.png?raw=true')
}