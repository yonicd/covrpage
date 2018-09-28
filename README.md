[![Travis-CI Build Status](https://travis-ci.org/yonicd/covrpage.svg?branch=master)](https://travis-ci.org/yonicd/covrpage)
[![Coverage Status](https://img.shields.io/codecov/c/github/yonicd/covrpage/master.svg)](https://codecov.io/github/yonicd/covrpage?branch=master)
[![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_27-brightgreen.svg)](http://tinyurl.com/y7qge5ta)


# {covrpage} <img src="https://github.com/yonicd/covrpage/blob/master/inst/logo/covrpage_small.png?raw=true" align="right" />

Healthy R packages use [testthat](https://github.com/r-lib/testthat) and [covr](https://github.com/r-lib/covr) to develop stable packages. 

This package extends the information that is communicated with the potential user with a cover page for the tests in the form of summary tables of results from covr and testthat. 

The output is created in the [tests](tests) subdirectory as a [README.md](tests/README.md) file so it will show up in Github browser page. 

## Examples of active use of {covrpage} in other repositories

  - [{slackr}](https://github.com/hrbrmstr/slackr/tree/master/tests)
  - [{remedy}](https://github.com/thinkr-open/remedy/tree/master/tests)
  - [{mathpix}](https://github.com/jonocarroll/mathpix/tree/master/tests)
  - [{carbonate}](https://github.com/yonicd/carbonate/tree/master/tests)
  - [{GSEAdv}](https://github.com/llrs/GSEAdv)

## Package Installation

```
# install.packages('remotes')

remotes::install_github('yonicd/covrpage')
```

## Usage

```
# assuming you are in your package root directory

covrpage::covrpage()

# create the covrpage and send directly to remote repository

covrpage::covrpage(auto_push = TRUE)

# Copy output as a vignette to use in pkgdown

covrpage::covrpage_snapshot(vignette = TRUE)

# assuming you are not in your package directory

covrpage::covrpage('another_directory')

# peek at an R package on a Github Repository

covrpage::covrpage_snapshot(repo = 'user/repo')
```

### Vignette

covrpage can be outputed as a vignette called `Tests and Coverage` making it part of the package help documentation and can be viewed as an [article](https://yonicd.github.io/covrpage/articles/tests_and_coverage.html) in a [{pkgdown}](https://github.com/r-lib/pkgdown) site.

### Articles

  - [Test Results](https://yonicd.github.io/covrpage/articles/Test_Results.html)
  - [Continuous Integration](https://yonicd.github.io/covrpage/articles/Continuous_Integration.html)


That's it!

Any questions/comments are always welcome in the [issues](https://github.com/yonicd/covrpage/issues) section.
