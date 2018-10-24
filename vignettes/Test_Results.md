---
title: "Test Results Indicators"
author: "Jonathan Sidi"
date: "2018-10-24"
output: 
  rmarkdown::html_vignette: 
    keep_md: true
vignette: >
  %\VignetteIndexEntry{Test Results Indicators}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



## Badge

{covrpage} has its own reactive badge. After the README.md file is rendered a badge in the main README page is updated with the render date and the colour indicates the state of the tests. If you are using README.Rmd to compile the README file that is ok too, covrpage will update the rmd file and render it to update the md file for you. 

  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_04-brightgreen.svg)](http://tinyurl.com/y965gzrq) all tests passed
  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_04-yellow.svg)](http://tinyurl.com/y965gzrq) warning/skipped tests
  - [![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2018_09_04-red.svg)](http://tinyurl.com/y965gzrq) error/failed tests
  
To create the script for the badge to paste in the root README run the following, it will locate the `.git` and fill in the information it needs to build the uri.

```r
covrpage::make_badge()
masking https://github.com/yonicd/covrpage/tree/master/tests/README.md with http://tinyurl.com/ycoe59ud
"[![Covrpage Summary](https://img.shields.io/badge/covrpage-Initialized-orange.svg)](http://tinyurl.com/ycoe59ud)"
```

## Show Detailed Test Results

If all the unit tests have passed then the table showing the detailed unit tests will be collapsed, else it will be open. 

## Links to Tests

All files and unit tests referenced in the output tables contain links back to the relevant file in the repository. In the detailed unit tests table the links have line anchors to where the relevant expectation block begins. 
