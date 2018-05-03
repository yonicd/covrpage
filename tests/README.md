Tests and Coverage
================
03 May, 2018 13:23:26

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
|:---------------------------------------------------|:------------:|
| covrpage                                           |     66.47    |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |     50.00    |
| [R/covrpage.R](../R/covrpage.R)                    |     68.97    |
| [R/create\_chunks.R](../R/create_chunks.R)         |     98.21    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

| file                                               |    n|   time|  error|  failed|  skipped|  warning|
|:---------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-check\_utils.R](testthat/test-check_utils.R) |    4|  0.025|      0|       0|        0|        0|
| [test-covrfuns.R](testthat/test-covrfuns.R)        |    6|  0.355|      0|       0|        0|        0|
| [test-covrpage.R](testthat/test-covrpage.R)        |    1|  4.955|      0|       0|        0|        0|

| file                                               | test                  | context                                                 | status |    n|   time|
|:---------------------------------------------------|:----------------------|:--------------------------------------------------------|:-------|----:|------:|
| [test-check\_utils.R](testthat/test-check_utils.R) | tests are detected    | check if there are tests                                | PASS   |    1|  0.004|
| [test-check\_utils.R](testthat/test-check_utils.R) | packages are detected | check for packages                                      | PASS   |    3|  0.021|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   |    2|  0.083|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   |    3|  0.269|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr object to df     | check covr to df                                        | PASS   |    1|  0.003|
| [test-covrpage.R](testthat/test-covrpage.R)        | check on remote repo  | check against remote repo that main function is working | PASS   |    1|  4.955|
