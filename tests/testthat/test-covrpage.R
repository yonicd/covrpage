testthat::context("check against remote repo that main function is working")

testthat::describe("check on remote repo", {

  file.copy("../assets/covrpage_benchmark",tempdir(),recursive = TRUE)

  td <- file.path(tempdir(),'covrpage_benchmark')
      
  orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  testthat::skip('something')
  
  # testthat::skip_on_travis()
  # skip_if_not_rstudio()

  wd <- getwd()
  
  setwd(td)
  
  covrpage(preview = FALSE)

  setwd(wd)
  
  new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  it('file time update',{
    testthat::expect_true(difftime(orig_time, new_time) < 0)
  })
  
  unlink(td,recursive = TRUE,force = TRUE)
})
