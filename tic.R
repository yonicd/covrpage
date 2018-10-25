# remove possible lock files of packages in every stage

get_stage("after_script") %>%
  add_code_step(system("rm -rf $HOME/R/Library/00LOCK-*"))

get_stage("deploy") %>%
  add_step(step_build_pkgdown())%>%
  add_step(step_setup_push_deploy(branch = "gh-pages",orphan = TRUE))%>%
  add_step(step_do_push_deploy(commit_paths = "docs/*"))

get_stage("after_success") %>%
  add_code_step(setwd('c:/projects/covrpage'))%>%
  add_code_step(devtools::install())%>%
  add_code_step(covrpage::covrpage_ci())