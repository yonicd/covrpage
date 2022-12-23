Tests and Coverage
================
23 December, 2022 09:45:35

- <a href="#coverage" id="toc-coverage">Coverage</a>
- <a href="#unit-tests" id="toc-unit-tests">Unit Tests</a>

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                    | Coverage (%) |
|:----------------------------------------------------------|:------------:|
| covrpage                                                  |    32.41     |
| [R/coverage_skip.R](../R/coverage_skip.R)                 |     0.00     |
| [R/covrpage_ci.R](../R/covrpage_ci.R)                     |     0.00     |
| [R/covrpage_cleanup.R](../R/covrpage_cleanup.R)           |     0.00     |
| [R/covrpage_log.R](../R/covrpage_log.R)                   |     0.00     |
| [R/covrpage_snapshot.R](../R/covrpage_snapshot.R)         |     0.00     |
| [R/covrpage.R](../R/covrpage.R)                           |     0.00     |
| [R/icons.R](../R/icons.R)                                 |     0.00     |
| [R/is_utils.R](../R/is_utils.R)                           |     0.00     |
| [R/map_testthat_snapshot.R](../R/map_testthat_snapshot.R) |     0.00     |
| [R/map_testthat.R](../R/map_testthat.R)                   |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                           |     0.00     |
| [R/use_tic.R](../R/use_tic.R)                             |     0.00     |
| [R/utils.R](../R/utils.R)                                 |    18.18     |
| [R/covrpage_checks.R](../R/covrpage_checks.R)             |    26.92     |
| [R/badge.R](../R/badge.R)                                 |    42.11     |
| [R/testthat_summary.R](../R/testthat_summary.R)           |    60.20     |
| [R/use_covrpage.R](../R/use_covrpage.R)                   |    78.05     |
| [R/create_chunks.R](../R/create_chunks.R)                 |    96.15     |
| [R/vignette.R](../R/vignette.R)                           |    98.00     |
| [R/desc.R](../R/desc.R)                                   |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                              |   n |  time | error | failed | skipped | warning |
|:--------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-badge.R](testthat/test-badge.R)             |   2 | 3.851 |     0 |      0 |       0 |       0 |
| [test-check_utils.R](testthat/test-check_utils.R) |   5 | 0.237 |     0 |      0 |       0 |       0 |
| [test-covrfuns.R](testthat/test-covrfuns.R)       |   6 | 0.055 |     0 |      0 |       0 |       0 |
| [test-utilities.R](testthat/test-utilities.R)     |   1 | 0.003 |     0 |      0 |       0 |       0 |
| [test-vignette.R](testthat/test-vignette.R)       |   5 | 0.581 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                                  | context                    | test                                   | status |   n |  time |
|:------------------------------------------------------|:---------------------------|:---------------------------------------|:-------|----:|------:|
| [test-badge.R](testthat/test-badge.R#L14)             | badge                      | create badge: create                   | PASS   |   1 | 3.573 |
| [test-badge.R](testthat/test-badge.R#L19)             | badge                      | create badge: output message           | PASS   |   1 | 0.278 |
| [test-check_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected                     | PASS   |   1 | 0.006 |
| [test-check_utils.R](testthat/test-check_utils.R#L14) | check for packages         | packages are detected                  | PASS   |   3 | 0.032 |
| [test-check_utils.R](testthat/test-check_utils.R#L23) | use covrpage               | test use_covrpage                      | PASS   |   1 | 0.199 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)        | check summary covr         | covr_summary: standard input           | PASS   |   1 | 0.020 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)    | check summary covr         | covr_summary: empty input              | PASS   |   1 | 0.009 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)       | check summary output types | with data: short                       | PASS   |   1 | 0.011 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)       | check summary output types | with data: long                        | PASS   |   1 | 0.007 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)       | check summary output types | with data: no data                     | PASS   |   1 | 0.005 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L35)       | check covr to df           | covr object to df: empty input         | PASS   |   1 | 0.003 |
| [test-utilities.R](testthat/test-utilities.R#L10_L13) | utils                      | find package in path: benchmark        | PASS   |   1 | 0.003 |
| [test-vignette.R](testthat/test-vignette.R#L23)       | vignettes                  | testing vignette: file time update     | PASS   |   1 | 0.006 |
| [test-vignette.R](testthat/test-vignette.R#L29)       | vignettes                  | testing vignette: create vignette dir  | PASS   |   1 | 0.169 |
| [test-vignette.R](testthat/test-vignette.R#L39)       | vignettes                  | testing vignette: add suggests         | PASS   |   1 | 0.134 |
| [test-vignette.R](testthat/test-vignette.R#L47)       | vignettes                  | testing vignette: append suggests      | PASS   |   1 | 0.139 |
| [test-vignette.R](testthat/test-vignette.R#L57)       | vignettes                  | testing vignette: add vignette builder | PASS   |   1 | 0.133 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                            |
|:---------|:---------------------------------|
| Version  | R version 4.2.1 (2022-06-23)     |
| Platform | x86_64-apple-darwin17.0 (64-bit) |
| Running  | macOS Big Sur 11.7.2             |
| Language | en_US                            |
| Timezone | America/New_York                 |

| Package  | Version |
|:---------|:--------|
| testthat | 3.1.4   |
| covr     | 3.6.1   |
| covrpage | 0.1     |

</details>
<!--- Final Status : pass --->
