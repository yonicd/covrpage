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
  
})
