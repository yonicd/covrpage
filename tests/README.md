Tests and Coverage
================
30 April, 2018 22:00:26

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
|:---------------------------------------------------|:------------:|
| covrpage                                           |     73.61    |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/covrpage.R](../R/covrpage.R)                    |     74.07    |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |     85.71    |
| [R/create\_chunks.R](../R/create_chunks.R)         |     97.96    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

| file                                               |    n|   time|  error|  failed|  skipped|  warning|
|:---------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-check\_utils.R](testthat/test-check_utils.R) |    4|  0.024|      0|       0|        0|        0|
| [test-covrfuns.R](testthat/test-covrfuns.R)        |    6|  0.153|      0|       0|        0|        0|
| [test-covrpage.R](testthat/test-covrpage.R)        |    0|  0.003|      1|       0|        0|        0|

| file                                               | test                  | context                                                 | status |    n|   time|
|:---------------------------------------------------|:----------------------|:--------------------------------------------------------|:-------|----:|------:|
| [test-check\_utils.R](testthat/test-check_utils.R) | tests are detected    | check if there are tests                                | PASS   |    1|  0.003|
| [test-check\_utils.R](testthat/test-check_utils.R) | packages are detected | check for packages                                      | PASS   |    3|  0.021|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   |    2|  0.030|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   |    3|  0.122|
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr object to df     | check covr to df                                        | PASS   |    1|  0.001|
| [test-covrpage.R](testthat/test-covrpage.R)        | check on remote repo  | check against remote repo that main function is working | PASS   |    0|  0.003|
