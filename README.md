[![Travis-CI Build Status](https://travis-ci.org/yonicd/covrpage.svg?branch=master)](https://travis-ci.org/yonicd/covrpage)
[![Coverage Status](https://img.shields.io/codecov/c/github/yonicd/covrpage/master.svg)](https://codecov.io/github/yonicd/covrpage?branch=master)
[![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_07_05-brightgreen.svg)](https://github.com/yonicd/covrpage/tree/master/tests/README.md)

# {covrpage}

Healthy R packages use [testthat](https://github.com/r-lib/testthat) and [covr](https://github.com/r-lib/covr) to develop stable packages. 

This package extends the information that is communicated with the potential user with a cover page for the tests in the form of summary tables of results from covr and testthat. 

The output is created in the [tests](tests) subdirectory as a [README.md](tests/README.md) file so it will show up in Github browser page. 

<details>
<summary> <font color="red">Example Output</font> </summary>

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    50.13     |
| [R/covrpage\_snapshot.R](R/covrpage_snapshot.R) |     0.00     |
| [R/map\_testthat.R](R/map_testthat.R)           |     0.00     |
| [R/tencrypt.R](R/tencrypt.R)                    |     0.00     |
| [R/use\_covrpage.R](R/use_covrpage.R)           |    63.64     |
| [R/covrpage\_checks.R](R/covrpage_checks.R)     |    64.29     |
| [R/covrpage.R](R/covrpage.R)                    |    65.79     |
| [R/badge.R](R/badge.R)                          |    66.67     |
| [R/testthat\_summary.R](R/testthat_summary.R)   |    93.55     |
| [R/create\_chunks.R](R/create_chunks.R)         |    96.00     |

<br>

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](tests/testthat/test-check_utils.R) | 5 | 0.088 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](tests/testthat/test-covrfuns.R)        | 6 | 0.096 |     0 |      0 |       0 |       0 |
| test-covrpage.R     | [test-covrpage.R](tests/testthat/test-covrpage.R)        | 1 | 3.669 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context                                                 | test                           | status | n |  time |
| :----------------------------------------------------- | :------------------------------------------------------ | :----------------------------- | :----- | -: | ----: |
| [test-check\_utils.R](tests/testthat/test-check_utils.R#L4)  | check for tests                                         | tests are detected             | PASS   | 1 | 0.017 |
| [test-check\_utils.R](tests/testthat/test-check_utils.R#L12) | check for packages                                      | packages are detected          | PASS   | 3 | 0.038 |
| [test-check\_utils.R](tests/testthat/test-check_utils.R#L22) | use covrpage                                            | test use\_covrpage             | PASS   | 1 | 0.033 |
| [test-covrfuns.R](tests/testthat/test-covrfuns.R#L5)         | check summary covr                                      | covr\_summary: standard input  | PASS   | 1 | 0.058 |
| [test-covrfuns.R](tests/testthat/test-covrfuns.R#L9)         | check summary covr                                      | covr\_summary: empty input     | PASS   | 1 | 0.001 |
| [test-covrfuns.R](tests/testthat/test-covrfuns.R#L17)        | check summary output types                              | with data: short               | PASS   | 1 | 0.021 |
| [test-covrfuns.R](tests/testthat/test-covrfuns.R#L21)        | check summary output types                              | with data: long                | PASS   | 1 | 0.014 |
| [test-covrfuns.R](tests/testthat/test-covrfuns.R#L25)        | check summary output types                              | with data: no data             | PASS   | 1 | 0.001 |
| [test-covrfuns.R](tests/testthat/test-covrfuns.R#L34)        | check covr to df                                        | covr object to df: empty input | PASS   | 1 | 0.001 |
| [test-covrpage.R](tests/testthat/test-covrpage.R#L20)        | check against remote repo that main function is working | check on remote repo           | PASS   | 1 | 3.669 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.0 (2018-04-23)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.4   |

</details>

</details>

## Examples of active use of {covrpage} in other repositories

  - [{slackr}](https://github.com/hrbrmstr/slackr/tree/master/tests)
  - [{remedy}](https://github.com/thinkr-open/remedy/tree/master/tests)
  - [{mathpix}](https://github.com/jonocarroll/mathpix/tree/master/tests)

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

# assuming you are not in your package directory

covrpage::covrpage('another_directory')

# peek at an R package on a Github Repository

covrpage::covrpage_snapshot(repo = 'user/repo')
```

## Test Results Indicators

### Badge

{covrpage} has its own reactive badge. After the README.md file is rendered a badge in the main README page is updated with the render date and the colour indicates the state of the tests. If you are using README.Rmd to compile the README file that is ok too, covrpage will update the rmd file and render it to update the md file for you. 

  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_07_05-brightgreen.svg)](https://github.com/yonicd/covrpage/tree/master/tests/README.md) all tests passed
  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_07_05-yellow.svg)](https://github.com/yonicd/covrpage/tree/master/tests/README.md) warning/skipped tests
  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_07_05-red.svg)](https://github.com/yonicd/covrpage/tree/master/tests/README.md) error/failed tests
  
To create the script for the badge to paste in the root README run the following, it will locate the `.git` and fill in the information it needs to build the uri.

```r
covrpage::make_badge()
[1] "[![Covrpage Summary](https://img.shields.io/badge/covrpage-Initialized-orange.svg)](https://github.com/yonicd/covrpage/tree/master/tests/README.md)"
```

### Show Detailed Test Results

If all the unit tests have passed then the table showing the detailed unit tests will be collapsed, else it will be open. 

### Links to Tests

All files and unit tests referenced in the output tables contain links back to the relevant file in the repository. In the detailed unit tests table the links have line anchors to where the relevant expectation block begins. 

## Travis

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

## TODO

  - run `covr::package_coverage` excluding failing tests to avert fail on rmd build.
    - see [skip branch](https://github.com/yonicd/covrpage/tree/skip)

That's it!

Any questions/comments are always welcome in the [issues](https://github.com/yonicd/covrpage/issues) section.
