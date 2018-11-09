testthat::context("check against remote repo that main function is working")

testthat::describe("check on remote repo", {

  testthat::skip_on_travis()
  
  file.copy("../assets/covrpage_benchmark/covrpage",tempdir(),recursive = TRUE)

  td <- file.path(tempdir(),'covrpage')
      
  orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]
  
  wd <- getwd()
  
  setwd(td)
  
  covrpage::covrpage(preview = FALSE)

  setwd(wd)
  
  new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  it('file time update',{
    testthat::expect_true(difftime(orig_time, new_time) < 0)
  })
  
  unlink(td,recursive = TRUE,force = TRUE)
})
