#' @title Summary outputs for testthat object
#' @description summary outputs for testthat object that is used in rmd
#' @param x list, testthat object output
#' @param type character, format of the object output, Default: c("short", "long")
#' @return data.frame
#' @rdname testthat_summary
#' @export 
#' @import dplyr
#' @importFrom tidyr gather spread
#' @importFrom rlang UQ sym UQS syms
testthat_summary <- function(x,type=c('short','long')){

x <- dplyr::as_data_frame(x)

switch(type,
       
       'short'={
         
         melt_cols <- c('failed','skipped','error','warning')
         
         x%>%
           dplyr::group_by(rlang::UQ(rlang::sym('file')))%>%
           dplyr::select(n=rlang::UQ(rlang::sym('nb')),
                         time=rlang::UQ(rlang::sym('real')),
                         rlang::UQS(rlang::syms(melt_cols))
                         )%>%
           dplyr::mutate_all(as.numeric)%>%
           tidyr::gather(key = 'status_type',value='status',
                         rlang::UQS(rlang::syms(melt_cols)))%>%
           dplyr::group_by(rlang::UQS(rlang::syms(c('file','status_type'))))%>%
           dplyr::summarise_at(dplyr::vars(rlang::UQS(rlang::syms(c('n','time','status')))),
                               dplyr::funs(sum))%>%
           tidyr::spread(key = rlang::UQ(rlang::sym('status_type')),value=rlang::UQ(rlang::sym('status')))%>%
           dplyr::ungroup()%>%
           dplyr::mutate(file=sprintf('[%s](testthat/%s)',
                                      rlang::UQ(rlang::sym('file')),
                                      rlang::UQ(rlang::sym('file'))))
         
       },
       'long'={
         
         x%>%
           dplyr::mutate(status=ifelse(rlang::UQ(rlang::sym('failed')),'FAIL','PASS'))%>%
           dplyr::select(rlang::UQS(rlang::syms(c('file','test','context','status'))),
                         n=rlang::UQ(rlang::sym('nb')),time=rlang::UQ(rlang::sym('real')))%>%
           dplyr::mutate(file=sprintf('[%s](testthat/%s)',
                                      rlang::UQ(rlang::sym('file')),
                                      rlang::UQ(rlang::sym('file'))))
         
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
#' @import dplyr
#' @importFrom rlang UQ sym
covr_summary <- function(x){

  x%>%
    covr_print_to_df()%>%
    dplyr::mutate(name=ifelse(grepl('^R/',rlang::UQ(rlang::sym('name'))),
                              sprintf('[%s](../%s)',
                                      rlang::UQ(rlang::sym('name')),
                                      rlang::UQ(rlang::sym('name'))),
                              rlang::UQ(rlang::sym('name')))
                  )
}