Tests and Coverage
================
27 April, 2018 10:12:43

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                     | Coverage (%) |
|:-------------------------------------------|:------------:|
| covrpage                                   |     60.64    |
| [R/covrpage.R](../R/covrpage.R)            |     20.00    |
| [R/create\_chunks.R](../R/create_chunks.R) |     97.96    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

| file                                        |    n|   time|  error|  failed|  skipped|  warning|
|:--------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-covrfuns.R](testthat/test-covrfuns.R) |    0|  0.009|      3|       0|        0|        0|
| [test-covrpage.R](testthat/test-covrpage.R) |    0|  0.001|      1|       0|        0|        0|

| file                                        | test               | context                  | status |    n|   time|
|:--------------------------------------------|:-------------------|:-------------------------|:-------|----:|------:|
| [test-covrfuns.R](testthat/test-covrfuns.R) | covr\_summary      | check summary covr       | PASS   |    0|  0.002|
| [test-covrfuns.R](testthat/test-covrfuns.R) | covr\_summary      | check summary covr       | PASS   |    0|  0.001|
| [test-covrfuns.R](testthat/test-covrfuns.R) | covr object to df  | check covr to df         | PASS   |    0|  0.006|
| [test-covrpage.R](testthat/test-covrpage.R) | tests are detected | check if there are tests | PASS   |    0|  0.001|
