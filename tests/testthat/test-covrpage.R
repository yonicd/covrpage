context("check if there are tests")

test_that("tests are detected", {
  expect_equal(covrpage:::check_for_tests('.'),2)
})

context("check for packages")

test_that("pacakges are detected", {
  expect_length(covrpage:::check_for_pkgs(),0)
})
