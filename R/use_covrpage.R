#' @title Add covrpage to Travis CI for a git directory
#' @description Adds bash file to execute after Travis test is successfully completed.
#' @param file character, file path to save bash script to, Default: '.travis/covrpage.sh'
#' @param travis_type character, build .travis.yml template for bash script,
#'  pkgdown deployment or using the 'tic' package from ropenscilabs on GitHub
#'  Default: c('bash','pkgdown','tic')
#' @param travis_blocks character, vector that defines what .travis.yml blocks tocreate,
#' Default: c('after_success','after_failure','deploy_ghpages')
#' @param gh_user character, Github user name,
#' Default: gsub("@(.*?)$", "", system("git config user.email", intern = TRUE))
#' @param push_branch character, branch Travis will create to push updated covrpage readme file, Default: 'test'
#' @param repo character, name of git repo that package is hosted on, Default: system("git config travis.slug", intern = TRUE)
#' @param deploy_branch character, name of branch that current package build is located,
#' Default: system("git rev-parse --abbrev-ref HEAD", intern = TRUE) (usually 'master')
#' @examples
#'
#' use_covrpage(travis_type = 'bash',file=file.path(tempdir(),'myfile.sh'))
#'
#' #does not write to disk
#' use_covrpage(travis_type = 'bash',file=NULL)
#'
#' use_covrpage(travis_type = 'pkgdown')
#' use_covrpage(travis_type = 'pkgdown',travis_block = 'after_success')
#' use_covrpage(travis_type = 'pkgdown',travis_block = 'after_failure')
#' use_covrpage(travis_type = 'pkgdown',travis_block = c('after_success','after_failure'))
#' @rdname use_covrpage
#' @family setup
#' @importFrom whisker whisker.render
#' @export

use_covrpage <- function(file = ".travis/covrpage.sh",
                         travis_type = c("bash", "pkgdown","tic"),
                         travis_blocks = c("after_success", "after_failure", "deploy_ghpages"),
                         gh_user = gsub("@(.*?)$", "", system("git config user.email", intern = TRUE)),
                         push_branch = "test",
                         repo = system("git config travis.slug", intern = TRUE),
                         deploy_branch = system("git rev-parse --abbrev-ref HEAD", intern = TRUE)) {
  
  as_render     <- NULL
  af_render     <- NULL
  deploy_render <- NULL
  s_pr          <- NULL
  
  travis_type <- match.arg(travis_type, c("bash", "pkgdown","tic"))
  
  if(travis_type=='tic'){
    use_tic()
    return(invisible(NULL))
  }
  
  if ("after_success" %in% travis_blocks) {
    as_template <- readLines(system.file(sprintf("templates/%s/after_success.txt", travis_type), package = "covrpage"))
    as_render <- whisker::whisker.render(as_template, data = list(file = file))
  }

  if ("after_failure" %in% travis_blocks) {
    af_template <- readLines(system.file(sprintf("templates/%s/after_failure.txt", travis_type), package = "covrpage"))
    af_render <- whisker::whisker.render(af_template, data = list(file = file))
  }

  if ("deploy_ghpages" %in% travis_blocks) {
    deploy_template <- readLines(system.file(sprintf("templates/%s/deploy.txt", travis_type), package = "covrpage"))
    deploy_render <- whisker::whisker.render(deploy_template)
  }

  msg <- whisker::whisker.render(
    template = readLines(system.file(sprintf("templates/%s/use_covrpage_msg.txt", travis_type), package = "covrpage")),
    data = list(success = as_render, failure = af_render, deploy_ghpages = deploy_render)
  )

  if (travis_type == "bash") {
    s_pr <- whisker::whisker.render(
      template = readLines(system.file(sprintf("templates/%s/use_covrpage.txt", travis_type), package = "covrpage")),
      data = list(
        deploy_branch = deploy_branch,
        push_branch = push_branch,
        gh_user = gh_user,
        repo = repo
      )
    )

    if (is.null(file)) {
      writeLines(s_pr)

      invisible(s_pr)
    } else {
      if (!dir.exists(dirname(file))) {
        message(sprintf("Creating %s directory", dirname(file)))
        dir.create(dirname(file))
      }

      message(sprintf("Writing %s bash script to %s", basename(file), dirname(file)))
      cat(s_pr, sep = "\n", file = file)

      message(msg)
    }
  } else {
    message(msg)
  }
}
