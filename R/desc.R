installed_pkgs <- function(){
  
  x <- utils::installed.packages()[,c(1,3)]
  rownames(x) <- NULL
  ret <- as.data.frame(x,stringsAsFactors = FALSE)
  names(ret)[2] <- 'Installed_Version'
  ret
  
}

parse_desc_deps <- function(pkg){
  pkg <- normalizePath(pkg, mustWork = FALSE)
  
  if (!file.exists(file.path(pkg, "DESCRIPTION"))) {
    stop(sprintf("No package DESCRIPTION file in %s", pkg))
  }
  
  desc <- as.list(read.dcf(file.path(pkg, "DESCRIPTION"))[1, ])
  
  dep_imp <- desc[intersect(c("Depends", "Imports"), names(desc))]
  
  dep_imp_clean <- lapply(dep_imp, function(x){
    x <- gsub('\\s+|\\n','',x)
    strsplit(x, ",") 
  })
  
  pkg_deps <- gsub("\\s(.*?)$", "", unlist(dep_imp_clean, use.names = FALSE))
  
  pkg_deps <- union(pkg_deps, c("testthat", "knitr"))
  
  pkg_deps <- pkg_deps[!grepl("R", pkg_deps)]
  
  #strip out version from import names
  pkg_names <- gsub('\\s*\\((.*?)$','',pkg_deps) 
  
  pkg_versions <- mapply(
    FUN = function(x,y) gsub(sprintf('%s|\\(|\\)|[>=]',x),'',y),
    pkg_names,pkg_deps,
    USE.NAMES = FALSE
  )
  
  data.frame(Package = pkg_names, Desc_Version = pkg_versions, stringsAsFactors = FALSE)
  
}

compare_pkgs <- function(pkg){
  
  x <- merge(parse_desc_deps(pkg),installed_pkgs(),all.x = TRUE,by='Package')
  
  x$flag  <- FALSE
  
  x$flag[is.na(x$Installed_Version)] <- TRUE
  
  idx <- !nzchar(x$Desc_Version)
  
  x$Desc_Version[idx] <- x$Installed_Version[idx]
  
  for(i in 1:nrow(x)){
    dv <- x$Desc_Version[i]
    iv <- x$Installed_Version[i]
    
    if(!is.na(iv)){
      x$flag[i] <- package_version(iv) < package_version(dv)
    }
  }
  
  x[x$flag,]
}
