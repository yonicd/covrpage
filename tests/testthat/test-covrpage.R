testthat::context("check against benchmark repo that main function is working")

testthat::describe("check on benchmark repo", {
  testthat::skip_on_travis()

  file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)

  td <- file.path(tempdir(), "covrpage")

  orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  wd <- getwd()

  setwd(td)

  covrpage::covrpage(preview = FALSE)

  setwd(wd)

  new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  it("file time update", {
    testthat::expect_true(difftime(orig_time, new_time) < 0)
  })

  unlink(td, recursive = TRUE, force = TRUE)
})

testthat::describe("check ci wrapper on benchmark repo", {
  testthat::skip_on_travis()

  file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)
  td <- file.path(tempdir(), "covrpage")
  wd <- getwd()
  setwd(td)
  repo <- git2r::init()
  file.create(".travis.yml")
  git2r::add(repo, ".travis.yml")
  git2r::remote_add(repo, name = "origin", url = "git@github.com:metrumresearchgroup/covrpage.git")
  git2r::commit(repo, message = "test commit")

  orig_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  covrpage::covrpage_ci()

  setwd(wd)

  new_time <- file.info(file.path(td, "tests/README.md"))[["mtime"]]

  it("file time update", {
    testthat::expect_true(difftime(orig_time, new_time) < 0)
  })

  unlink(td, recursive = TRUE, force = TRUE)
})
