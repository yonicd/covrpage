# testthat::context("check against benchmark repo that main function is working")
# 
# testthat::describe("check on benchmark repo", {
#   testthat::skip_on_ci()
# 
#   file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)
# 
#   td <- file.path(tempdir(), "covrpage")
# 
#   orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]
# 
#   wd <- getwd()
# 
#   setwd(td)
# 
#   covrpage::covrpage(preview = FALSE)
# 
#   setwd(wd)
# 
#   new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]
# 
#   it("file time update", {
#     testthat::expect_true(difftime(orig_time, new_time) < 0)
#   })
# 
#   unlink(td, recursive = TRUE, force = TRUE)
# })
# 
# testthat::describe("check ci wrapper on benchmark repo", {
#   testthat::skip_on_ci()
# 
#   file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)
#   td <- file.path(tempdir(), "covrpage")
#   wd <- getwd()
#   setwd(td)
#   gert::git_init()
#   file.create(".travis.yml")
#   gert::git_add(".travis.yml")
#   gert::git_remote_add(name = "origin", url = "https://github.com/yonicd/covrpage.git")
#   gert::git_commit(message = "test commit")
# 
#   orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]
# 
#   covrpage::covrpage_ci()
# 
#   setwd(wd)
# 
#   new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]
# 
#   it("file time update", {
#     testthat::expect_true(difftime(orig_time, new_time) < 0)
#   })
# 
#   unlink(td, recursive = TRUE, force = TRUE)
# })
