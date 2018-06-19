Tests and Coverage
================
19 June, 2018 12:00:05

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    44.13     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/map\_testthat.R](../R/map_testthat.R)           |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                    |     0.00     |
| [R/covrpage.R](../R/covrpage.R)                    |    63.46     |
| [R/use\_covrpage.R](../R/use_covrpage.R)           |    63.64     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |    64.29     |
| [R/testthat\_summary.R](../R/testthat_summary.R)   |    91.49     |
| [R/create\_chunks.R](../R/create_chunks.R)         |    96.00     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.268 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.171 |     0 |      0 |       0 |       0 |
| test-covrpage.R     | [test-covrpage.R](testthat/test-covrpage.R)        | 1 | 4.565 |     0 |      0 |       0 |       0 |

| file                                                   | context                                                 | test                           | status | n |  time |
| :----------------------------------------------------- | :------------------------------------------------------ | :----------------------------- | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests                                         | tests are detected             | PASS   | 1 | 0.018 |
| [test-check\_utils.R](testthat/test-check_utils.R#L12) | check for packages                                      | packages are detected          | PASS   | 3 | 0.190 |
| [test-check\_utils.R](testthat/test-check_utils.R#L22) | use covrpage                                            | test use\_covrpage             | PASS   | 1 | 0.060 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr                                      | covr\_summary: standard input  | PASS   | 1 | 0.091 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9)         | check summary covr                                      | covr\_summary: empty input     | PASS   | 1 | 0.004 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L17)        | check summary output types                              | with data: short               | PASS   | 1 | 0.041 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L21)        | check summary output types                              | with data: long                | PASS   | 1 | 0.028 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L25)        | check summary output types                              | with data: no data             | PASS   | 1 | 0.006 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L34)        | check covr to df                                        | covr object to df: empty input | PASS   | 1 | 0.001 |
| [test-covrpage.R](testthat/test-covrpage.R#L20)        | check against remote repo that main function is working | check on remote repo           | PASS   | 1 | 4.565 |
