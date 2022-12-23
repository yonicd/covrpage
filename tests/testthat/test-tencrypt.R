# testthat::context("encryption of PAT")
# 
# testthat::describe("testing tencrypt", {
#   testthat::skip_on_ci()
# 
#   file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)
#   td <- file.path(tempdir(), "covrpage")
#   wd <- getwd()
#   setwd(td)
#   repo <- git2r::init()
#   file.create(".travis.yml")
#   git2r::add(repo, ".travis.yml")
#   git2r::remote_add(repo, name = "origin", url = "git@github.com:yonicd/covrpage.git")
# 
#   it("no add", {
#     testthat::expect_equal(nchar(tencrypt(add = FALSE)), 686)
#   })
# 
#   tencrypt()
# 
#   it("with add", {
#     testthat::expect_equal(length(readLines(".travis.yml")), 3)
#   })
# 
#   setwd(wd)
#   unlink(td, recursive = TRUE, force = TRUE)
# })
