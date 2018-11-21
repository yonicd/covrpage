add_package_checks()

  if (ci()$get_branch() == "tic") {
    get_stage("deploy") %>%
      add_code_step(covr::codecov()) %>%
      add_code_step(devtools::install()) %>%
#      add_code_step(install.packages("spelling")) %>%
      add_code_step(covrpage::covrpage_ci()) %>%
      add_step(step_push_deploy(commit_paths = "tests/README.md")) %>%
      add_step(step_build_pkgdown()) %>%
      add_step(step_push_deploy(path = "docs", branch = "gh-pages"))
  }else{
    get_stage("deploy") %>%
      add_code_step(covr::codecov()) %>%
      add_code_step(devtools::install()) %>%
      add_code_step(covrpage::covrpage_ci()) %>%
      add_step(step_push_deploy(commit_paths = "tests/README.md"))
  }
