Tests and Coverage
================
26 August, 2018 12:11:51

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

    ## NULL

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    49.28     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                    |     0.00     |
| [R/map\_testthat.R](../R/map_testthat.R)           |     5.05     |
| [R/coverage\_skip.R](../R/coverage_skip.R)         |    12.50     |
| [R/use\_covrpage.R](../R/use_covrpage.R)           |    63.64     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |    64.29     |
| [R/covrpage.R](../R/covrpage.R)                    |    65.79     |
| [R/badge.R](../R/badge.R)                          |    66.67     |
| [R/testthat\_summary.R](../R/testthat_summary.R)   |    93.55     |
| [R/create\_chunks.R](../R/create_chunks.R)         |    96.00     |

    ## NULL

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.079 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.071 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context                    | test                           | status | n |  time |
| :----------------------------------------------------- | :------------------------- | :----------------------------- | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected             | PASS   | 1 | 0.018 |
| [test-check\_utils.R](testthat/test-check_utils.R#L12) | check for packages         | packages are detected          | PASS   | 3 | 0.027 |
| [test-check\_utils.R](testthat/test-check_utils.R#L22) | use covrpage               | test use\_covrpage             | PASS   | 1 | 0.034 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr         | covr\_summary: standard input  | PASS   | 1 | 0.038 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)     | check summary covr         | covr\_summary: empty input     | PASS   | 1 | 0.002 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)        | check summary output types | with data: short               | PASS   | 1 | 0.017 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)        | check summary output types | with data: long                | PASS   | 1 | 0.011 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)        | check summary output types | with data: no data             | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L35)        | check covr to df           | covr object to df: empty input | PASS   | 1 | 0.002 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.0 (2018-04-23)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.51  |

</details>

<!--- Final Status : pass --->
