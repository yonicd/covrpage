#' importFrom utils sessionInfo packageVersion
sinfo <- function(){
  
  x <- utils::sessionInfo()
  
  sinfo <- c(Version  = x$R.version$version.string,
             Platform = x$platform,
             Running  = x$running,
             Language = gsub('\\.(.*?)$','',Sys.getlocale(category = 'LC_COLLATE')),
             Timezone = Sys.timezone())
  
  pkgs <- sapply(c('testthat','covr','covrpage'),function(x) as.character(utils::packageVersion(x)))
  
  sinfo <- enfram(sinfo, name = 'Field',value = 'Value')
  
  if(is_ci()){
    
    sinfo <- ci_img(sinfo)
    
  }
  
  pkgs <- enfram(pkgs, name = 'Package',value = 'Version')
  
  list(info = sinfo, pkgs = pkgs)
  
}
