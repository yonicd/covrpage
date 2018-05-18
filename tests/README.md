Tests and Coverage
================
18 May, 2018 16:31:15

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    47.43     |
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
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.095 |     0 |      0 |       0 |       0 |
| test-covrpage.R     | [test-covrpage.R](testthat/test-covrpage.R)        | 1 | 3.962 |     0 |      0 |       0 |       0 |

| file                                                   | context                                                 | test                           | status | n |  time |
| :----------------------------------------------------- | :------------------------------------------------------ | :----------------------------- | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests                                         | tests are detected             | PASS   | 1 | 0.002 |
| [test-check\_utils.R](testthat/test-check_utils.R#L12) | check for packages                                      | packages are detected          | PASS   | 3 | 0.016 |
| [test-check\_utils.R](testthat/test-check_utils.R#L21) | use covrpage                                            | test use\_covrpage             | PASS   | 1 | 0.035 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr                                      | covr\_summary: standard input  | PASS   | 1 | 0.055 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9)         | check summary covr                                      | covr\_summary: empty input     | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L18)        | check summary output types                              | with data: short               | PASS   | 1 | 0.022 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L22)        | check summary output types                              | with data: long                | PASS   | 1 | 0.014 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L26)        | check summary output types                              | with data: no data             | PASS   | 1 | 0.002 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L36)        | check covr to df                                        | covr object to df: empty input | PASS   | 1 | 0.001 |
| [test-covrpage.R](testthat/test-covrpage.R#L19)        | check against remote repo that main function is working | check on remote repo           | PASS   | 1 | 3.962 |
