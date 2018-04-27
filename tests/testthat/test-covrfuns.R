context('check summary covr')

test_that('covr_summary',{
  
  expect_s3_class(covrpage::covr_summary(covr_test),'tbl_df')
  expect_error(covrpage::covr_summary())
  
})

context('check summary covr')

test_that('covr_summary',{
  
  expect_s3_class(covrpage::testthat_summary(testthat_test,'short'),'tbl_df')
  expect_s3_class(covrpage::testthat_summary(testthat_test,'long'),'tbl_df')
  expect_null(covrpage::testthat_summary(testthat_test,'something'))
  
})

context('check covr to df')

test_that('covr object to df',{
  expect_null(covr_print_to_df(c()))
})