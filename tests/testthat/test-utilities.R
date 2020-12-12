testthat::context('utils')

testthat::describe('find package in path',{
  testthat::skip_on_ci()
  file.copy("../assets/covrpage_benchmark/covrpage", tempdir(), recursive = TRUE)
  td <- file.path(tempdir(), "covrpage")
  
  it('benchmark',{
    
    testthat::expect_equal(
      'covrpage',
      covrpage:::package_name(td)
      )
  })
})
