#' @title Summary outputs for testthat object
#' @description summary outputs for testthat object that is used in rmd
#' @param x list, testthat object output
#' @param type character, format of the object output, Default: c("short", "long")
#' @return data.frame
#' @rdname testthat_summary
#' @export 
#' @import dplyr
#' @importFrom tidyr gather spread
testthat_summary <- function(x,type=c('short','long')){

x <- dplyr::as_data_frame(x)

switch(type,
       
       'short'={
         x%>%
           dplyr::group_by(file)%>%
           dplyr::select(n=nb,time=real,failed,skipped,error,warning)%>%
           dplyr::mutate_all(as.numeric)%>%
           tidyr::gather(key = 'status_type',value='status',-c(file,n,time))%>%
           dplyr::group_by(file,status_type)%>%
           dplyr::summarise_at(dplyr::vars(n,time,status),dplyr::funs(sum))%>%
           tidyr::spread(key = status_type,value=status)%>%
           dplyr::ungroup()%>%
           dplyr::mutate(file=sprintf('[%s](testthat/%s)',file,file))
       },
       'long'={
         
         x%>%
           dplyr::mutate(status=ifelse(failed,'FAIL','PASS'))%>%
           dplyr::select(file,test,context,status,n=nb,time=real,failed)%>%
           dplyr::mutate(file=sprintf('[%s](testthat/%s)',file,file))%>%
           dplyr::select(-c(failed))
         
       })

} 

#' @importFrom tibble enframe
#' @importFrom covr percent_coverage tally_coverage
covr_print_to_df <- function(x, group = c("filename", "functions"), by = "line"){
  
  if (length(x) == 0) {
    return()
  }
  
  group <- match.arg(group)
  
  type <- attr(x, "type")
  
  if (is.null(type) || type == "none") {
    type <- NULL
  }
  
  df <- covr::tally_coverage(x, by = by)
  
  if (!NROW(df)) {
    return(invisible())
  }
  
  percents <- tapply(df$value, df[[group]], FUN = function(x) (sum(x > 0)/length(x)) * 100)
  
  overall_percentage <- covr::percent_coverage(df, by = by)
  
  names(overall_percentage) <- attr(x, "package")$package
  
  by_coverage <- percents[order(percents, names(percents))]
  
  return(tibble::enframe(c(overall_percentage,by_coverage)))
}

#' @title Summary outputs for covr object
#' @description Creates a summary data.frame for covr object output that 
#' mimics the console print method of \code{\link[covr]{package_coverage}}
#' @param x covr object
#' @return data.frame
#' @seealso 
#'  \code{\link[covr]{package_coverage}}
#' @rdname covr_summary
#' @export 
#' @importFrom dplyr mutate
covr_summary <- function(x){

  x%>%
    covr_print_to_df()%>%
    dplyr::mutate(name=ifelse(grepl('^R/',name),
                              sprintf('[%s](../%s)',name,name),
                              name)
                  )
}