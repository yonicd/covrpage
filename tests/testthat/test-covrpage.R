testthat::context("check against remote repo that main function is working")

td <- "../assets/covrpage_benchmark"

testthat::describe("check on remote repo", {
  
  orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  thiswd <- getwd()

  testthat::skip_on_travis()

  setwd(td)
  
  covrpage(".", preview = FALSE)

  setwd(thiswd)

  new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  it('file time update',{
    testthat::expect_true(difftime(orig_time, new_time) < 0)
  })
})
