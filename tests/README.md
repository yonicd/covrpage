Tests and Coverage
================
14 May, 2018 09:10:01

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    68.95     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |    50.00     |
| [R/covrpage.R](../R/covrpage.R)                    |    66.67     |
| [R/use\_covrpage.R](../R/use_covrpage.R)           |    67.86     |
| [R/create\_chunks.R](../R/create_chunks.R)         |    96.43     |
| [R/testthat\_summary.R](../R/testthat_summary.R)   |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](testthat/test-check_utils.R) | 6 | 0.408 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.082 |     0 |      0 |       0 |       0 |
| test-covrpage.R     | [test-covrpage.R](testthat/test-covrpage.R)        | 1 | 4.663 |     0 |      0 |       0 |       0 |

| file                                               | test                  | context                                                 | status | n |  time |
| :------------------------------------------------- | :-------------------- | :------------------------------------------------------ | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R) | tests are detected    | check for tests                                         | PASS   | 1 | 0.003 |
| [test-check\_utils.R](testthat/test-check_utils.R) | packages are detected | check for packages                                      | PASS   | 3 | 0.017 |
| [test-check\_utils.R](testthat/test-check_utils.R) | test use\_covrpage    | use covrpage                                            | PASS   | 1 | 0.034 |
| [test-check\_utils.R](testthat/test-check_utils.R) | test travis encrypt   | use covrpage                                            | PASS   | 1 | 0.354 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   | 2 | 0.041 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   | 3 | 0.040 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr object to df     | check covr to df                                        | PASS   | 1 | 0.001 |
| [test-covrpage.R](testthat/test-covrpage.R)        | check on remote repo  | check against remote repo that main function is working | PASS   | 1 | 4.663 |
