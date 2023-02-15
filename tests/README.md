Tests and Coverage
================
15 February, 2023 13:00:48

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                      | Coverage (%) |
| :---------------------------------------------------------- | :----------: |
| covrpage                                                    |    12.24     |
| [R/badge.R](../R/badge.R)                                   |     0.00     |
| [R/coverage\_skip.R](../R/coverage_skip.R)                  |     0.00     |
| [R/covrpage\_ci.R](../R/covrpage_ci.R)                      |     0.00     |
| [R/covrpage\_cleanup.R](../R/covrpage_cleanup.R)            |     0.00     |
| [R/covrpage\_log.R](../R/covrpage_log.R)                    |     0.00     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R)          |     0.00     |
| [R/covrpage.R](../R/covrpage.R)                             |     0.00     |
| [R/desc.R](../R/desc.R)                                     |     0.00     |
| [R/icons.R](../R/icons.R)                                   |     0.00     |
| [R/is\_utils.R](../R/is_utils.R)                            |     0.00     |
| [R/map\_testthat\_snapshot.R](../R/map_testthat_snapshot.R) |     0.00     |
| [R/map\_testthat.R](../R/map_testthat.R)                    |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                             |     0.00     |
| [R/use\_covrpage.R](../R/use_covrpage.R)                    |     0.00     |
| [R/use\_tic.R](../R/use_tic.R)                              |     0.00     |
| [R/utils.R](../R/utils.R)                                   |     0.00     |
| [R/vignette.R](../R/vignette.R)                             |     0.00     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)              |    15.38     |
| [R/testthat\_summary.R](../R/testthat_summary.R)            |    60.20     |
| [R/create\_chunks.R](../R/create_chunks.R)                  |    96.15     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                               | n |  time | error | failed | skipped | warning | icon |
| :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-check\_utils.R](testthat/test-check_utils.R) | 4 | 0.083 |     0 |      0 |       1 |       1 | 🔶⚠️  |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.045 |     0 |      0 |       0 |       0 |      |

<details open>

<summary> Show Detailed Test Results </summary>

| file                                                   | context                    | test                           | status  | n |  time | icon |
| :----------------------------------------------------- | :------------------------- | :----------------------------- | :------ | -: | ----: | :--- |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected             | PASS    | 1 | 0.042 |      |
| [test-check\_utils.R](testthat/test-check_utils.R#L12) | check for packages         | packages are detected          | SKIPPED | 1 | 0.008 | 🔶    |
| [test-check\_utils.R](testthat/test-check_utils.R#L23) | use covrpage               | test use\_covrpage             | WARNING | 2 | 0.033 | ⚠️   |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr         | covr\_summary: standard input  | PASS    | 1 | 0.018 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)     | check summary covr         | covr\_summary: empty input     | PASS    | 1 | 0.007 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)        | check summary output types | with data: short               | PASS    | 1 | 0.008 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)        | check summary output types | with data: long                | PASS    | 1 | 0.005 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)        | check summary output types | with data: no data             | PASS    | 1 | 0.004 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L35)        | check covr to df           | covr object to df: empty input | PASS    | 1 | 0.003 |      |

| Failed | Warning | Skipped |
| :----- | :------ | :------ |
| 🛑      | ⚠️      | 🔶       |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                  |
| :------- | :---------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.2.2 (2022-10-31)  |                                                                                                                                                                                                                                                                  |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/covrpage/commit/77a7223ae889b0ee4112323f005972ea611035cc/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.1 LTS            |                                                                                                                                                                                                                                                                  |
| Language | C                             |                                                                                                                                                                                                                                                                  |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                  |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>

<!--- Final Status : skipped/warning --->
