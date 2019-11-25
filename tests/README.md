Tests and Coverage
================
24 November, 2019 20:40:17

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr)
package.

| Object                                                      | Coverage (%) |
| :---------------------------------------------------------- | :----------: |
| covrpage                                                    |    72.89     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R)          |     0.00     |
| [R/map\_testthat\_snapshot.R](../R/map_testthat_snapshot.R) |     0.00     |
| [R/use\_tic.R](../R/use_tic.R)                              |     0.00     |
| [R/utils.R](../R/utils.R)                                   |    18.18     |
| [R/icons.R](../R/icons.R)                                   |    21.74     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)              |    34.62     |
| [R/covrpage\_cleanup.R](../R/covrpage_cleanup.R)            |    54.55     |
| [R/is\_utils.R](../R/is_utils.R)                            |    66.67     |
| [R/coverage\_skip.R](../R/coverage_skip.R)                  |    75.00     |
| [R/use\_covrpage.R](../R/use_covrpage.R)                    |    78.05     |
| [R/tencrypt.R](../R/tencrypt.R)                             |    92.31     |
| [R/covrpage\_log.R](../R/covrpage_log.R)                    |    92.86     |
| [R/badge.R](../R/badge.R)                                   |    92.98     |
| [R/map\_testthat.R](../R/map_testthat.R)                    |    95.05     |
| [R/create\_chunks.R](../R/create_chunks.R)                  |    96.15     |
| [R/testthat\_summary.R](../R/testthat_summary.R)            |    96.74     |
| [R/vignette.R](../R/vignette.R)                             |    98.00     |
| [R/covrpage\_ci.R](../R/covrpage_ci.R)                      |    100.00    |
| [R/covrpage.R](../R/covrpage.R)                             |    100.00    |
| [R/desc.R](../R/desc.R)                                     |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                               | n |  time | error | failed | skipped | warning |
| :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-badge.R](testthat/test-badge.R)              | 2 | 0.506 |     0 |      0 |       0 |       0 |
| [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.077 |     0 |      0 |       0 |       0 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.046 |     0 |      0 |       0 |       0 |
| [test-tencrypt.R](testthat/test-tencrypt.R)        | 2 | 1.594 |     0 |      0 |       0 |       0 |
| [test-utilities.R](testthat/test-utilities.R)      | 1 | 0.002 |     0 |      0 |       0 |       0 |
| [test-vignette.R](testthat/test-vignette.R)        | 5 | 0.111 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context                    | test                                   | status | n |  time |
| :----------------------------------------------------- | :------------------------- | :------------------------------------- | :----- | -: | ----: |
| [test-badge.R](testthat/test-badge.R#L14)              | badge                      | create badge: create                   | PASS   | 1 | 0.262 |
| [test-badge.R](testthat/test-badge.R#L19)              | badge                      | create badge: output message           | PASS   | 1 | 0.244 |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected                     | PASS   | 1 | 0.001 |
| [test-check\_utils.R](testthat/test-check_utils.R#L14) | check for packages         | packages are detected                  | PASS   | 3 | 0.017 |
| [test-check\_utils.R](testthat/test-check_utils.R#L23) | use covrpage               | test use\_covrpage                     | PASS   | 1 | 0.059 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr         | covr\_summary: standard input          | PASS   | 1 | 0.025 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)     | check summary covr         | covr\_summary: empty input             | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)        | check summary output types | with data: short                       | PASS   | 1 | 0.010 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)        | check summary output types | with data: long                        | PASS   | 1 | 0.005 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)        | check summary output types | with data: no data                     | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L35)        | check covr to df           | covr object to df: empty input         | PASS   | 1 | 0.004 |
| [test-tencrypt.R](testthat/test-tencrypt.R#L16)        | encryption of PAT          | testing tencrypt: no add               | PASS   | 1 | 1.592 |
| [test-tencrypt.R](testthat/test-tencrypt.R#L22)        | encryption of PAT          | testing tencrypt: with add             | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L10_L13)  | utils                      | find package in path: benchmark        | PASS   | 1 | 0.002 |
| [test-vignette.R](testthat/test-vignette.R#L23)        | vignettes                  | testing vignette: file time update     | PASS   | 1 | 0.001 |
| [test-vignette.R](testthat/test-vignette.R#L29)        | vignettes                  | testing vignette: create vignette dir  | PASS   | 1 | 0.025 |
| [test-vignette.R](testthat/test-vignette.R#L39)        | vignettes                  | testing vignette: add suggests         | PASS   | 1 | 0.030 |
| [test-vignette.R](testthat/test-vignette.R#L47)        | vignettes                  | testing vignette: append suggests      | PASS   | 1 | 0.029 |
| [test-vignette.R](testthat/test-vignette.R#L57)        | vignettes                  | testing vignette: add vignette builder | PASS   | 1 | 0.026 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.1 (2019-07-05)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.2.1   |
| covr     | 3.3.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
