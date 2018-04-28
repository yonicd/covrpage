context("check if there are tests")

test_that("tests are detected", {
  expect_equal(covrpage:::check_for_tests('.'),2)
})

context("check for packages")

test_that("packages are detected", {
  expect_error(covrpage:::check_for_pkgs('.'))
  expect_error(covrpage:::check_for_pkgs('..'))
})

context('check against remote repo that main function is working')

td <- system.file('covrpage_benchmark',package = 'covrpage')

test_that("check on remote repo",{
  
  orig_time <- file.info(file.path(td,'tests/README.md'))[['mtime']]
  
  thiswd <- getwd()
  
  setwd(td)
  
  covrpage(td,preview = FALSE)

  new_time <- file.info(file.path(td,'tests/README.md'))[['mtime']]
  
  setwd(thiswd)
  
  expect_true(difftime(orig_time,new_time)<0)
  
  unlink(td,recursive = TRUE,force = TRUE)

})
