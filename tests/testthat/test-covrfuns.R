testthat::context('check summary covr')

testthat::test_that('covr_summary',{
  
  testthat::expect_s3_class(covrpage::covr_summary(covrpage:::covr_test),'data.frame')
  testthat::expect_error(covrpage::covr_summary())
  
})

testthat::context('check summary covr')

testthat::test_that('covr_summary',{
  
  testthat::expect_s3_class(covrpage::testthat_summary(covrpage:::testthat_test,'short'),'data.frame')
  testthat::expect_s3_class(covrpage::testthat_summary(covrpage:::testthat_test,'long'),'data.frame')
  testthat::expect_null(covrpage::testthat_summary(covrpage:::testthat_test,'something'))
  
})

testthat::context('check covr to df')

testthat::test_that('covr object to df',{
  testthat::expect_null(covrpage:::covr_print_to_df(c()))
})