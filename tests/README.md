Tests and Coverage
================
12 December, 2020 15:42:16

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                      | Coverage (%) |
| :---------------------------------------------------------- | :----------: |
| covrpage                                                    |    12.81     |
| [R/badge.R](../R/badge.R)                                   |     0.00     |
| [R/coverage\_skip.R](../R/coverage_skip.R)                  |     0.00     |
| [R/covrpage\_ci.R](../R/covrpage_ci.R)                      |     0.00     |
| [R/covrpage\_cleanup.R](../R/covrpage_cleanup.R)            |     0.00     |
| [R/covrpage\_log.R](../R/covrpage_log.R)                    |     0.00     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R)          |     0.00     |
| [R/covrpage.R](../R/covrpage.R)                             |     0.00     |
| [R/desc.R](../R/desc.R)                                     |     0.00     |
| [R/map\_testthat\_snapshot.R](../R/map_testthat_snapshot.R) |     0.00     |
| [R/map\_testthat.R](../R/map_testthat.R)                    |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                             |     0.00     |
| [R/use\_covrpage.R](../R/use_covrpage.R)                    |     0.00     |
| [R/use\_tic.R](../R/use_tic.R)                              |     0.00     |
| [R/utils.R](../R/utils.R)                                   |     0.00     |
| [R/vignette.R](../R/vignette.R)                             |     0.00     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)              |    15.38     |
| [R/testthat\_summary.R](../R/testthat_summary.R)            |    60.00     |
| [R/create\_chunks.R](../R/create_chunks.R)                  |    96.15     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                               | n |  time | error | failed | skipped | warning | icon |
| :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.126 |     0 |      0 |       1 |       2 | 🔶⚠️  |
| [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.066 |     0 |      0 |       0 |       0 |      |

<details open>

<summary> Show Detailed Test Results </summary>

| file                                                   | context                    | test                           | status  | n |  time | icon |
| :----------------------------------------------------- | :------------------------- | :----------------------------- | :------ | -: | ----: | :--- |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected             | PASS    | 1 | 0.033 |      |
| [test-check\_utils.R](testthat/test-check_utils.R#L12) | check for packages         | packages are detected          | SKIPPED | 1 | 0.022 | 🔶    |
| [test-check\_utils.R](testthat/test-check_utils.R#L23) | use covrpage               | test use\_covrpage             | WARNING | 3 | 0.071 | ⚠️   |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr         | covr\_summary: standard input  | PASS    | 1 | 0.024 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)     | check summary covr         | covr\_summary: empty input     | PASS    | 1 | 0.008 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)        | check summary output types | with data: short               | PASS    | 1 | 0.021 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)        | check summary output types | with data: long                | PASS    | 1 | 0.007 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)        | check summary output types | with data: no data             | PASS    | 1 | 0.003 |      |
| [test-covrfuns.R](testthat/test-covrfuns.R#L35)        | check covr to df           | covr object to df: empty input | PASS    | 1 | 0.003 |      |

| Failed | Warning | Skipped |
| :----- | :------ | :------ |
| 🛑      | ⚠️      | 🔶       |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                             |
| :------- | :-------------------------------- |
| Version  | R version 4.0.3 (2020-10-10)      |
| Platform | x86\_64-apple-darwin17.0 (64-bit) |
| Running  | macOS Catalina 10.15.7            |
| Language | en\_US                            |
| Timezone | UTC                               |

| Package  | Version |
| :------- | :------ |
| testthat | 3.0.0   |
| covr     | 3.3.2   |
| covrpage | 0.1     |

</details>

<!--- Final Status : skipped/warning --->
