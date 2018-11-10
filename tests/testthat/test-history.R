testthat::context('coverage history')

testthat::describe('fetch md files',{
  
  testthat::skip_on_travis()
  
  file.copy("../assets/covrpage_benchmark/covrpage",tempdir(),recursive = TRUE)
  td <- file.path(tempdir(),'covrpage')
  wd <- getwd()
  setwd(td)
  repo <- git2r::init()
  git2r::add(repo,path = '.')
  git2r::commit(repo,message = 'init commit')
  covrpage::covrpage(preview = FALSE,update_badge = FALSE)
  git2r::add(repo,path = '.')
  git2r::commit(repo,message = 'new commit')
  
  mds <- covrpage::covrpage_log()
  
  it('outer class',{
    testthat::expect_true(inherits(mds,'list'))
  })
  
  it('inner class',{
    testthat::expect_true(inherits(mds[[1]],'character'))
  })
  
  setwd(wd)
  
  unlink(td,recursive = TRUE,force = TRUE)
  
})

testthat::describe('fetch covr history',{
  
  testthat::skip_on_travis()
  
  file.copy("../assets/covrpage_benchmark/covrpage",tempdir(),recursive = TRUE)
  td <- file.path(tempdir(),'covrpage')
  wd <- getwd()
  setwd(td)
  repo <- git2r::init()
  git2r::add(repo,path = '.')
  git2r::commit(repo,message = 'init commit')
  covrpage::covrpage(preview = FALSE,update_badge = FALSE)
  git2r::add(repo,path = '.')
  git2r::commit(repo,message = 'new commit')
  
  ret <- covrpage::covr_log()
  
  it('class',{
    testthat::expect_true(inherits(ret,'data.frame'))
  })
  
  it('dim',{
    testthat::expect_equal(ncol(ret),3)
  })
  
  setwd(wd)
  
  unlink(td,recursive = TRUE,force = TRUE)
  
})