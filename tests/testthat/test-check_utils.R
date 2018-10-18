testthat::context("check for tests")

testthat::test_that("tests are detected", {
  testthat::expect_equal(covrpage:::check_for_tests("."), 2)
})

testthat::context("check for packages")

td <- "../assets/covrpage_benchmark"

testthat::test_that("packages are detected", {
  testthat::expect_error(covrpage:::check_for_pkgs("."))
  testthat::expect_error(covrpage:::check_for_pkgs(".."))

  testthat::skip_on_travis()
  testthat::skip('something')
  testthat::expect_null(covrpage:::check_for_pkgs(td))
})

testthat::context("use covrpage")

testthat::test_that("test use_covrpage", {
  testthat::expect_is(covrpage:::use_covrpage(file = NULL), "character")
})
