#' @title Add covrpage to Travis CI for a git directory
#' @description Adds bash file to execute after Travis test is successfully completed.
#' @param file character, file path to save bash script to, Default: '.travis/covrpage.sh'
#' @param gh_user character, Github user name,
#' Default: gsub("@(.*?)$", "", system("git config user.email", intern = TRUE))
#' @param push_branch character, branch Travis will create to push updated covrpage readme file, Default: 'test'
#' @param repo character, name of git repo that package is hosted on, Default: system("git config travis.slug", intern = TRUE)
#' @param deploy_branch character, name of branch that current package build is located,
#' Default: system("git rev-parse --abbrev-ref HEAD", intern = TRUE) (usually 'master')
#' @rdname use_covrpage
#' @importFrom whisker whisker.render
#' @export

use_covrpage <- function(file = ".travis/covrpage.sh",
                         gh_user = gsub("@(.*?)$", "", system("git config user.email", intern = TRUE)),
                         push_branch = "test",
                         repo = system("git config travis.slug", intern = TRUE),
                         deploy_branch = system("git rev-parse --abbrev-ref HEAD", intern = TRUE)) {
  
  s_pr <- whisker::whisker.render(template = readLines(system.file('use_covrpage_bash.txt',package='covrpage')),
                                  data = list(deploy_branch = deploy_branch,
                                              push_branch = push_branch,
                                              gh_user = gh_user,
                                              repo = repo)
                                  )
  
  msg <- whisker::whisker.render(template = readLines(system.file('use_covrpage_msg.txt',package='covrpage')),
                                 data = list(file=file)
                                 )
  
  
  if (is.null(file)) {
    writeLines(s_pr)

    invisible(s_pr)
  } else {
    if (!dir.exists(dirname(file))) {
      message("Creating .travis directory")
      dir.create(dirname(file))
    }

    message("Writing covrpage.sh bash script to .travis")
    cat(s_pr, sep = "\n", file = file)

    message(msg)
  }
}
