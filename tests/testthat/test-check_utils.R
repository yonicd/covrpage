context("check if there are tests")

test_that("tests are detected", {
  expect_equal(covrpage:::check_for_tests('.'),2)
})

context("check for packages")

td <- system.file('covrpage_benchmark',package = 'covrpage')

test_that("packages are detected", {
  expect_error(covrpage:::check_for_pkgs('.'))
  expect_error(covrpage:::check_for_pkgs('..'))
  expect_null(covrpage:::check_for_pkgs(td))
})