Tests and Coverage
================
14 May, 2018 08:54:01

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    40.00     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/covrpage.R](../R/covrpage.R)                    |     0.00     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |    27.78     |
| [R/sum\_func.R](../R/sum_func.R)                   |    90.48     |
| [R/create\_chunks.R](../R/create_chunks.R)         |    96.30     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](testthat/test-check_utils.R) | 3 | 0.012 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.062 |     0 |      0 |       0 |       0 |

| file                                               | test                  | context                  | status | n |  time |
| :------------------------------------------------- | :-------------------- | :----------------------- | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R) | tests are detected    | check if there are tests | PASS   | 1 | 0.002 |
| [test-check\_utils.R](testthat/test-check_utils.R) | packages are detected | check for packages       | PASS   | 2 | 0.010 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr       | PASS   | 2 | 0.024 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr       | PASS   | 3 | 0.037 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr object to df     | check covr to df         | PASS   | 1 | 0.001 |
