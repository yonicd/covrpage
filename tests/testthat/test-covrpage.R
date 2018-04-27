context("check if there are tests")

test_that("tests are detected", {
  expect_equal(check_for_tests('.'),2)
})

check_for_pkgs()

context("check for packages")

test_that("pacakges are detected", {
  expect_length(check_for_pkgs(),0)
})