Tests and Coverage
================
28 April, 2018 12:21:33

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
|:---------------------------------------------------|:------------:|
| covrpage                                           |     90.91    |
| [R/covrpage.R](../R/covrpage.R)                    |     82.54    |
| [R/create\_chunks.R](../R/create_chunks.R)         |     97.96    |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |    100.00    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

| file                                               |    n|   time|  error|  failed|  skipped|  warning|
|:---------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-check\_utils.R](testthat/test-check_utils.R) |    4|  0.025|      0|       0|        0|        0|
| [test-covrfuns.R](testthat/test-covrfuns.R)        |    6|  0.107|      0|       0|        0|        0|
| [test-covrpage.R](testthat/test-covrpage.R)        |    2|  6.177|      1|       0|        0|        0|

| file                                               | test                        | context                                                 | status |    n|   time|
|:---------------------------------------------------|:----------------------------|:--------------------------------------------------------|:-------|----:|------:|
| [test-check\_utils.R](testthat/test-check_utils.R) | tests are detected          | check if there are tests                                | PASS   |    1|  0.004|
| [test-check\_utils.R](testthat/test-check_utils.R) | packages are detected       | check for packages                                      | PASS   |    3|  0.021|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary               | check summary covr                                      | PASS   |    2|  0.037|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary               | check summary covr                                      | PASS   |    3|  0.069|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr object to df           | check covr to df                                        | PASS   |    1|  0.001|
| [test-covrpage.R](testthat/test-covrpage.R)        | check on remote repo        | check against remote repo that main function is working | PASS   |    1|  5.246|
| [test-covrpage.R](testthat/test-covrpage.R)        | check covrpage from GH repo | snapshot                                                | PASS   |    1|  0.931|
