# covrpage

Healthy packages use testthat and covr to develop stable R packages. This package extends the information that is communicated with the potential user with summary tables of results from covr and testthat. 

The output is created in the [tests](tests) subdirectory as a readme file so it will show up in Github and be a cover page for the tests conducted. 

## Package Installation

```
# install.packages('remotes')

remotes::install_github('yonicd/covrpage')
```

## Usage

```
# assuming you are in your pacakage directory

covrpage('.')

# assuming you are not in your pacakage directory

covrpage('another_directory')
```

That's it!

Any questions/comments are always welcome in the [issues](https://github.com/yonicd/covrpage/issues) section.