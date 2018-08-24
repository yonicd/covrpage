Tests and Coverage
================
24 August, 2018 08:19:59

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                             | Coverage (%) |
| :------------------------------------------------- | :----------: |
| covrpage                                           |    51.40     |
| [R/covrpage\_snapshot.R](../R/covrpage_snapshot.R) |     0.00     |
| [R/tencrypt.R](../R/tencrypt.R)                    |     0.00     |
| [R/map\_testthat.R](../R/map_testthat.R)           |     5.32     |
| [R/use\_covrpage.R](../R/use_covrpage.R)           |    63.64     |
| [R/covrpage\_checks.R](../R/covrpage_checks.R)     |    64.29     |
| [R/covrpage.R](../R/covrpage.R)                    |    65.79     |
| [R/badge.R](../R/badge.R)                          |    66.67     |
| [R/testthat\_summary.R](../R/testthat_summary.R)   |    93.55     |
| [R/create\_chunks.R](../R/create_chunks.R)         |    96.00     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                     | file                                               | n |  time | error | failed | skipped | warning |
| ------------------- | :------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-check\_utils.R | [test-check\_utils.R](testthat/test-check_utils.R) | 5 | 0.049 |     0 |      0 |       0 |       0 |
| test-covrfuns.R     | [test-covrfuns.R](testthat/test-covrfuns.R)        | 6 | 0.087 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context                    | test                           | status | n |  time |
| :----------------------------------------------------- | :------------------------- | :----------------------------- | :----- | -: | ----: |
| [test-check\_utils.R](testthat/test-check_utils.R#L4)  | check for tests            | tests are detected             | PASS   | 1 | 0.002 |
| [test-check\_utils.R](testthat/test-check_utils.R#L12) | check for packages         | packages are detected          | PASS   | 3 | 0.014 |
| [test-check\_utils.R](testthat/test-check_utils.R#L22) | use covrpage               | test use\_covrpage             | PASS   | 1 | 0.033 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L5)         | check summary covr         | covr\_summary: standard input  | PASS   | 1 | 0.028 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L9_L11)     | check summary covr         | covr\_summary: empty input     | PASS   | 1 | 0.002 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L19)        | check summary output types | with data: short               | PASS   | 1 | 0.041 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L23)        | check summary output types | with data: long                | PASS   | 1 | 0.014 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L27)        | check summary output types | with data: no data             | PASS   | 1 | 0.001 |
| [test-covrfuns.R](testthat/test-covrfuns.R#L36)        | check covr to df           | covr object to df: empty input | PASS   | 1 | 0.001 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.0 (2018-04-23)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/Montreal                    |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.51  |

</details>

<!--- Final Status : pass --->
