testthat::context('vignettes')

testthat::describe('testing vignette',{
  
  testthat::skip_on_travis()
  
  file.copy("../assets/covrpage_benchmark/covrpage",tempdir(),recursive = TRUE)
  td <- file.path(tempdir(),'covrpage')
  wd <- getwd()
  setwd(td)
  repo <- git2r::init()
  file.create('.gitgnore')
  git2r::add(repo,'.gitgnore')
  git2r::remote_add(repo,name = 'origin',url = 'git@github.com:yonicd/covrpage.git')
  git2r::commit(repo,message = 'test commit')
  
  orig_time <- file.info(file.path(td, "vignettes/tests_and_coverage.Rmd"))[["mtime"]]
  
  covrpage::use_covrpage_vignette()
  
  new_time <- file.info(file.path(td, "vignettes/tests_and_coverage.Rmd"))[["mtime"]]
  
  it('file time update',{
    testthat::expect_true(difftime(orig_time, new_time) < 0)
  })

  unlink('vignettes',recursive = TRUE,force = TRUE)
  
  it('create vignette dir',{
    testthat::expect_message(covrpage::use_covrpage_vignette(),regexp = 'creating')
  })
  
  DESC <- read.dcf('DESCRIPTION')
  DESC <- DESC[,-match('Suggests',colnames(DESC))]
  NEW_DESC <- matrix(DESC,nrow=1)
  colnames(NEW_DESC) <- names(DESC)
  write.dcf(NEW_DESC,file = 'DESCRIPTION')
  
  it('add suggests',{
    testthat::expect_message(covrpage::use_covrpage_vignette(),regexp = 'adding')
  })
  
  DESC <- read.dcf('DESCRIPTION')
  DESC[,match('Imports',colnames(DESC))] <- gsub(',rmarkdown','',DESC[,match('Imports',colnames(DESC))])
  write.dcf(NEW_DESC,file = 'DESCRIPTION')
  
  it('append suggests',{
    testthat::expect_message(covrpage::use_covrpage_vignette(),regexp = 'adding')
  })
  
  DESC <- read.dcf('DESCRIPTION')
  DESC <- DESC[,-match('VignetteBuilder',colnames(DESC))]
  NEW_DESC <- matrix(DESC,nrow=1)
  colnames(NEW_DESC) <- names(DESC)
  write.dcf(NEW_DESC,file = 'DESCRIPTION')
  
  it('add vignette builder',{
    testthat::expect_message(covrpage::use_covrpage_vignette(),regexp = 'adding')
  })
  
  setwd(wd)
  
  unlink(td,recursive = TRUE,force = TRUE)
  
})