[![Travis-CI Build Status](https://travis-ci.org/yonicd/covrpage.svg?branch=master)](https://travis-ci.org/yonicd/covrpage)
[![Coverage Status](https://img.shields.io/codecov/c/github/yonicd/covrpage/master.svg)](https://codecov.io/github/yonicd/covrpage?branch=master)

# covrpage

Healthy R packages use [testthat](https://github.com/r-lib/testthat) and [covr](https://github.com/r-lib/covr) to develop stable packages. 

This package extends the information that is communicated with the potential user with a cover page for the tests in the form of summary tables of results from covr and testthat. 

The output is created in the [tests](tests) subdirectory as a [README.md](tests/README.md) file so it will show up in Github browser page. 

## Package Installation

```
# install.packages('remotes')

remotes::install_github('yonicd/covrpage')
```

## Usage

```
# assuming you are in your package directory

covrpage::covrpage('.')

# create the covrpage and send diretly to remote repository

covrpage::covrpage('.', auto_push = TRUE)

# assuming you are not in your package directory

covrpage::covrpage('another_directory')

# peek at a R package on a Github Repository

covrpage::covrpage_snapshot(repo = 'user/repo')
```

## Using with Travis

`{covrpage}` can be deployed in travis much the way `{covr::covrall}` is deployed. The only difference is that `{covrpage}` will push back the updated `README.md` file to the originating repository so it can be updated as part of the custom integration routine. 

The follow `.travis.yml` is needed for the deployment

```r
language: R
sudo: false
cache: packages
after_success:
- Rscript -e 'covr::codecov()'
- bash .travis/covrpage.sh
r_github_packages: yonicd/covrpage
env:
  global:
    secure: [travis encrypted Github PAT]

```

The new lines that are added to the standard `{covr}` travis yml are 

```r
- bash .travis/covrpage.sh
```

This file is created when running `covrpage::use_covrpage()` in the `.travis` subdirectory.

```r
env:
  global:
    secure: IeWrPb9tC9oxkoceXs4NStZJFIJKtvi/qeErbv3OATeo+BylRwj9xzcmzQrV8ps...
```

In order to let travis push back into the originating repository you will need to give it persmission to do so.

You will need encrypt a [Github Public Access Token](https://github.com/settings/tokens) (PAT) to allow Travis to push back to the remote repository. This is done using the Travis command line [function](https://docs.travis-ci.com/user/encryption-keys/).

The default of the function assumes you have defined a system environment variable `GITHUB_PAT` and will use it to define a [Travis environment variable](https://docs.travis-ci.com/user/environment-variables/) as `GH_PAT`.

To define the Github PAT as a R environment variable

```r
Sys.setenv(GITHUB_PAT='PAT FROM GITHUB')
```

This is created using travis command line. It is an encryption of the GitHub Personal Access Token (PAT). 

Run the following line in the terminal when you are in the root project directory (where the `.git` folder in located), the output should be appended directly to the `.travis.yml` file. Each time you run it a new secure line is added to the yml.

```r
travis encrypt GH_PAT = "[YOUR GITHUB PAT]" --add
```

An additional utility function has been created to facilitate the command line call from within `R`

```r
covrpage::tencrypt(r_obj = Sys.getenv("GITHUB_PAT"),travis_env = "GH_PAT",add = TRUE)
```

## TODO

  - run `covr::package_coverage` excluding failing tests to avert fail on rmd build.
    - see [skip branch](https://github.com/yonicd/covrpage/tree/skip)

That's it!

Any questions/comments are always welcome in the [issues](https://github.com/yonicd/covrpage/issues) section.