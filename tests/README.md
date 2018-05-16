Tests and Coverage
================
16 May, 2018 14:13:58

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    58.06     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/map\_testthat.R](../R/map_testthat.R)           |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                    |     0.00     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |    50.00     |
| [R/use\_covrpage.R](../R/use_covrpage.R)           |    65.91     |
| [R/covrpage.R](../R/covrpage.R)                    |    66.67     |
| [R/create\_chunks.R](../R/create_chunks.R)         |    96.43     |
| [R/testthat\_summary.R](../R/testthat_summary.R)   |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.053 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.086 |     0 |      0 |       0 |       0 |
| test-covrpage.R     | [test-covrpage.R](testthat/test-covrpage.R)        | 1 | 4.696 |     0 |      0 |       0 |       0 |

| file                                               | test                  | context                                                 | status | n |  time |
| :------------------------------------------------- | :-------------------- | :------------------------------------------------------ | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R) | tests are detected    | check for tests                                         | PASS   | 1 | 0.003 |
| [test-check\_utils.R](testthat/test-check_utils.R) | packages are detected | check for packages                                      | PASS   | 3 | 0.016 |
| [test-check\_utils.R](testthat/test-check_utils.R) | test use\_covrpage    | use covrpage                                            | PASS   | 1 | 0.034 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   | 2 | 0.049 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr\_summary         | check summary covr                                      | PASS   | 3 | 0.035 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | covr object to df     | check covr to df                                        | PASS   | 1 | 0.002 |
| [test-covrpage.R](testthat/test-covrpage.R)        | check on remote repo  | check against remote repo that main function is working | PASS   | 1 | 4.696 |
