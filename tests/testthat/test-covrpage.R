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

# context('snapshot')
# 
# test_that('check covrpage from GH repo',{
#   expect_null(covrpage_snapshot(repo = 'hrbrmstr/slackr',preview = FALSE))
# })

thiswd <- getwd()

testthat::test_that('covrpage travis',{
  if(grepl('travis',normalizePath(dir(full.names = TRUE)[1])))
    covrpage::covrpage(pkg = thiswd, preview = FALSE, auto_push = TRUE)
  
  expect_true(2+2==4)
})