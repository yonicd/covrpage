---
title: "Continuous Integration"
author: "Jonathan Sidi"
date: "2018-11-06"
output: 
  rmarkdown::html_vignette: 
    keep_md: true
vignette: >
  %\VignetteIndexEntry{Continuous Integration}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



## Travis

### Direct

`{covrpage}` can be deployed in Travis much the way `{covr::covrall}` is deployed. The only difference is that `{covrpage}` will push back the updated `README.md` file to the originating repository so it can be updated as part of the custom integration routine. 

The following `.travis.yml` is needed for the deployment:

```yml
language: R
sudo: false
cache: packages

after_success:
- Rscript -e 'covr::codecov()'
- bash .travis/covrpage.sh

after_failure:
- bash .travis/covrpage.sh

r_github_packages: yonicd/covrpage
env:
  global:
    secure: [Travis encrypted Github PAT]

```

covrpage adds one new line to the standard `{covr}` Travis YML:

```yml
- bash .travis/covrpage.sh
```

This file is created when running `covrpage::use_covrpage()` in the `.travis` subdirectory:

```yml
env:
  global:
    secure: IeWrPb9tC9oxkoceXs4NStZJFIJKtvi/qeErbv3OATeo+BylRwj9xzcmzQrV8ps...
```

The bash script can be run on a successful or failed build creating the covrpage report. 

To allow Travis push back into the originating repository, you will need to give it permission to do so by providing an encrypted [GitHub Personal Access Token](https://github.com/settings/tokens) (PAT). This is done using the Travis command line [function](https://docs.travis-ci.com/user/encryption-keys/).

By default, the function assumes you have defined a system environment variable `GITHUB_PAT` and will use it to define a [Travis environment variable](https://docs.travis-ci.com/user/environment-variables/) as `GH_PAT`.

  - `R` Environment Variable

To define the Github PAT as an R environment variable:

```r
Sys.setenv(GITHUB_PAT='PAT FROM GITHUB')
```

  - Travis Environment Variable

Run the following line in the terminal when you are in the root project directory (where the `.git` folder in located), the output should be appended directly to the `.travis.yml` file. Each time you run it a new `secure` line is added to the yml.

```r
travis encrypt GH_PAT="[PAT FROM GITHUB]" --add
```

These two commands are combined into a utility function:

```r
covrpage::tencrypt(r_obj = Sys.getenv("GITHUB_PAT"),travis_env = "GH_PAT",add = TRUE)
```


### Deploy + pkgdown

You can also use [pkgdown](https://www.github.com/r-lib/pkgdown) to create a covrpage readme with Travis. This is relevant or successful builds only, since travis will not invoke a deploy on a failed build.

```yml
language: r
cache: packages

after_success:
- Rscript -e 'covr::codecov()'
- Rscript -e 'devtools::install(); covrpage::covrpage_ci()'
- Rscript -e 'pkgdown::build_site()'

r_github_packages: 
  - yonicd/covrpage
  - r-lib/pkgdown #either put this here or in Suggests in the DESCRIPTION file

deploy:
  provider: pages
  skip-cleanup: true
  github-token: "$GH_PAT"
  keep-history: true
  local-dir: docs
  on:
    branch: master

env:
  global:
    secure: [Travis encrypted Github PAT]
```
