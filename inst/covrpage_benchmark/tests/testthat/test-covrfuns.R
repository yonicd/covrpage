context('check summary covr')

test_that('covr_summary',{
  
  expect_s3_class(covrpage::covr_summary(covrpage:::covr_test),'tbl_df')
  expect_error(covrpage::covr_summary())
  
})
