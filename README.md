[![Travis-CI Build Status](https://travis-ci.org/yonicd/covrpage.svg?branch=master)](https://travis-ci.org/yonicd/covrpage)
[![Coverage Status](https://img.shields.io/codecov/c/github/yonicd/covrpage/master.svg)](https://codecov.io/github/yonicd/covrpage?branch=master)
[![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_05-brightgreen.svg)](http://tinyurl.com/y965gzrq)

# {covrpage}

Healthy R packages use [testthat](https://github.com/r-lib/testthat) and [covr](https://github.com/r-lib/covr) to develop stable packages. 

This package extends the information that is communicated with the potential user with a cover page for the tests in the form of summary tables of results from covr and testthat. 

The output is created in the [tests](tests) subdirectory as a [README.md](tests/README.md) file so it will show up in Github browser page. 

## Examples of active use of {covrpage} in other repositories

  - [{slackr}](https://github.com/hrbrmstr/slackr/tree/master/tests)
  - [{remedy}](https://github.com/thinkr-open/remedy/tree/master/tests)
  - [{mathpix}](https://github.com/jonocarroll/mathpix/tree/master/tests)
  - [{carbonate}](https://github.com/yonicd/carbonate/tree/master/tests)

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

## Test Results Indicators

### Badge

{covrpage} has its own reactive badge. After the README.md file is rendered a badge in the main README page is updated with the render date and the colour indicates the state of the tests. If you are using README.Rmd to compile the README file that is ok too, covrpage will update the rmd file and render it to update the md file for you. 

  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_04-brightgreen.svg)](http://tinyurl.com/y965gzrq) all tests passed
  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_04-yellow.svg)](http://tinyurl.com/y965gzrq) warning/skipped tests
  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_04-red.svg)](http://tinyurl.com/y965gzrq) error/failed tests
  
To create the script for the badge to paste in the root README run the following, it will locate the `.git` and fill in the information it needs to build the uri.

```r
covrpage::make_badge()
masking https://github.com/yonicd/covrpage/tree/master/tests/README.md with http://tinyurl.com/ycoe59ud
"[![Covrpage Summary](https://img.shields.io/badge/covrpage-Initialized-orange.svg)](http://tinyurl.com/ycoe59ud)"
```

### Show Detailed Test Results

If all the unit tests have passed then the table showing the detailed unit tests will be collapsed, else it will be open. 

### Links to Tests

All files and unit tests referenced in the output tables contain links back to the relevant file in the repository. In the detailed unit tests table the links have line anchors to where the relevant expectation block begins. 

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
travis encrypt GH_PAT = "[PAT FROM GITHUB]" --add
```

These two commands are combined into a utility function:

```r
covrpage::tencrypt(r_obj = Sys.getenv("GITHUB_PAT"),travis_env = "GH_PAT",add = TRUE)
```


### Deploy + pkgdown

You can also use [pkgdown](https://www.github.com/r-lib/pkgdown) to create a covrpage readme with Travis. Use the follow travis yml script

```yml
language: r
cache: packages

after_success:
  - Rscript -e 'covr::codecov()'
  - Rscript -e 'devtools::install(); covrpage::covrpage_travis()'
  - Rscript -e 'pkgdown::build_site()'

r_github_packages: 
  - yonicd/covrpage
  - r-lib/pkgdown #either put this here or in Suggests in the DESCRIPTION file

deploy:
  provider: pages
  skip-cleanup: true
  github-token: $GH_PAT
  keep-history: true
  local-dir: docs
  on:
    branch: master

```


That's it!

Any questions/comments are always welcome in the [issues](https://github.com/yonicd/covrpage/issues) section.
