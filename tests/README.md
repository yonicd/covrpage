Tests and Coverage
================
09 November, 2018 10:09:16

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                           | Coverage (%) |
| :----------------------------------------------- | :----------: |
| covrpage                                         |    85.38     |
| [R/covrpage\_cleanup.R](../R/covrpage_cleanup.R) |    53.66     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)   |    64.29     |
| [R/coverage\_skip.R](../R/coverage_skip.R)       |    75.00     |
| [R/covrpage.R](../R/covrpage.R)                  |    77.14     |
| [R/use\_covrpage.R](../R/use_covrpage.R)         |    79.41     |
| [R/testthat\_summary.R](../R/testthat_summary.R) |    88.30     |
| [R/badge.R](../R/badge.R)                        |    91.23     |
| [R/tencrypt.R](../R/tencrypt.R)                  |    92.31     |
| [R/map\_testthat.R](../R/map_testthat.R)         |    95.05     |
| [R/create\_chunks.R](../R/create_chunks.R)       |    96.00     |
| [R/vignette.R](../R/vignette.R)                  |    98.00     |
| [R/covrpage\_ci.R](../R/covrpage_ci.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                               | n |  time | error | failed | skipped | warning |
| :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-badge.R](testthat/test-badge.R)              | 2 | 0.495 |     0 |      0 |       0 |       0 |
| [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.117 |     0 |      0 |       0 |       0 |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.066 |     0 |      0 |       0 |       0 |
| [test-tencrypt.R](testthat/test-tencrypt.R)        | 2 | 1.517 |     0 |      0 |       0 |       0 |
| [test-vignette.R](testthat/test-vignette.R)        | 5 | 0.116 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context                    | test                                   | status | n |  time |
| :----------------------------------------------------- | :------------------------- | :------------------------------------- | :----- | -: | ----: |
| [test-badge.R](testthat/test-badge.R#L15)              | badge                      | create badge: create                   | PASS   | 1 | 0.280 |
| [test-badge.R](testthat/test-badge.R#L20)              | badge                      | create badge: output message           | PASS   | 1 | 0.215 |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected                     | PASS   | 1 | 0.002 |
| [test-check\_utils.R](testthat/test-check_utils.R#L15) | check for packages         | packages are detected                  | PASS   | 3 | 0.040 |
| [test-check\_utils.R](testthat/test-check_utils.R#L24) | use covrpage               | test use\_covrpage                     | PASS   | 1 | 0.075 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr         | covr\_summary: standard input          | PASS   | 1 | 0.030 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)     | check summary covr         | covr\_summary: empty input             | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)        | check summary output types | with data: short                       | PASS   | 1 | 0.020 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)        | check summary output types | with data: long                        | PASS   | 1 | 0.013 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)        | check summary output types | with data: no data                     | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L35)        | check covr to df           | covr object to df: empty input         | PASS   | 1 | 0.001 |
| [test-tencrypt.R](testthat/test-tencrypt.R#L17)        | encryption of PAT          | testing tencrypt: no add               | PASS   | 1 | 1.514 |
| [test-tencrypt.R](testthat/test-tencrypt.R#L23)        | encryption of PAT          | testing tencrypt: with add             | PASS   | 1 | 0.003 |
| [test-vignette.R](testthat/test-vignette.R#L24)        | vignettes                  | testing vignette: file time update     | PASS   | 1 | 0.002 |
| [test-vignette.R](testthat/test-vignette.R#L30)        | vignettes                  | testing vignette: create vignette dir  | PASS   | 1 | 0.026 |
| [test-vignette.R](testthat/test-vignette.R#L40)        | vignettes                  | testing vignette: add suggests         | PASS   | 1 | 0.031 |
| [test-vignette.R](testthat/test-vignette.R#L48)        | vignettes                  | testing vignette: append suggests      | PASS   | 1 | 0.031 |
| [test-vignette.R](testthat/test-vignette.R#L58)        | vignettes                  | testing vignette: add vignette builder | PASS   | 1 | 0.026 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.6           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version    |
| :------- | :--------- |
| testthat | 2.0.0.9000 |
| covr     | 3.2.0      |
| covrpage | 0.0.64     |

</details>

<!--- Final Status : pass --->
