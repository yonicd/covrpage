testthat::context("badge")

testthat::describe("create badge", {
  testthat::skip_on_ci()
  file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)
  td <- file.path(tempdir(), "covrpage")
  dir.create(td)
  withr::with_dir(td,{
    testthat::skip_on_ci()
    repo <- git2r::init()
    git2r::remote_add(repo, name = "origin", url = "git@github.com:yonicd/covrpage.git")
    
    it("create", {
      testthat::expect_true(grepl("badge", make_badge(active_branch = "master")))
    })
    
    
    it("output message", {
      testthat::expect_message(make_badge(active_branch = "master"), regexp = "masking")
    })
  })
  unlink(td, recursive = TRUE, force = TRUE)
})
