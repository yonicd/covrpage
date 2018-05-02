context('check against remote repo that main function is working')

td <- system.file('covrpage_benchmark',package = 'covrpage')

if(Sys.getenv("CI") == "true" && Sys.getenv("TRAVIS") == "true")
  file.create('/home/travis/build/yonicd/covrpage/test.txt')

test_that("check on remote repo",{
  
  orig_time <- file.info(file.path(td,'tests/README.md'))[['mtime']]
  
  thiswd <- getwd()
  
  setwd(td)
  
  covrpage(td,preview = FALSE)
  
  new_time <- file.info(file.path(td,'tests/README.md'))[['mtime']]
  
  setwd(thiswd)
  
  expect_true(difftime(orig_time,new_time)<0)
  
})

# testthat::test_that('bad test',{
# 
#   expect_true(2+2!=4)
# 
# })

# testthat::test_that('skip test',{
#   
#   x <- 2+2
#   
# })

# context('snapshot')
# 
# test_that('check covrpage from GH repo',{
#   expect_null(covrpage_snapshot(repo = 'hrbrmstr/slackr',preview = FALSE))
# })


# if(Sys.getenv("CI") == "true" && Sys.getenv("TRAVIS") == "true"){
#   
#   thiswd <- getwd()
#   
#   setwd('/home/travis/build/yonicd/covrpage')
#   system('git config --global user.email "travis@travis-ci.org"')
#   system('git config --global user.name "Travis CI"')
#   system('git checkout -b covrpage')
#   
#   file.create('test.txt')
#   
#   system('git add test.txt')
#   
#   system('git remote add master-covrpages https://${GH_TOKEN}@github.com/yonicd/covrpage.git')
#   
#   system('git commit -m "try a test [skip ci]"')
#   system('git push --quiet --set-upstream master covrpage ')
#   
#   setwd(thiswd)
# }