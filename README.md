
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis-CI Build
Status](https://travis-ci.org/yonicd/covrpage.svg?branch=master)](https://travis-ci.org/yonicd/covrpage)
[![Coverage
Status](https://img.shields.io/codecov/c/github/yonicd/covrpage/master.svg)](https://codecov.io/github/yonicd/covrpage?branch=master)
[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2022_12_23-brightgreen.svg)](http://tinyurl.com/yayrd3et)

# covrpage

Trust is earned not ~~inherited~~ importedFrom. Now that you’ve built a
cool package, you want potential users to trust it so that they might
adopt it. How to build trust in your piece of software? Unit testing is
part of the components building trustworthiness of your package. Imagine
you’re at the point where you’ve tested most lines of your code with
thorough assertions, including checks of edge cases. Proof of that hard
work will be a high test coverage, that potential users of your package
might notice thanks to a bright green coverage badge. But how would they
know your tests are thorough? That’s what `covrpage` helps you with, by
creating a [summary report](tests/README.md) of your tests that goes
beyond the coverage percentage. This way, potential users can see at a
glance how good the unit testing of your package is.

## Is `covrpage` report only for users?

No, it can also inform your work on your package, by helping you track
progress of the unit tests you’re working on, and it can show to
potential *contributors* where help is needed.

## Package Installation

    # install.packages('remotes')

    remotes::install_github('yonicd/covrpage')

## Usage

    # assuming you are in your package root directory

    covrpage::covrpage()

    # create the covrpage and send directly to remote repository

    covrpage::covrpage(auto_push = TRUE)

    # Copy output as a vignette to use in pkgdown

    covrpage::covrpage(vignette = TRUE)

    # assuming you are not in your package directory

    covrpage::covrpage(path = 'another_directory')

## Vignette

covrpage can be outputed as a vignette called `Tests and Coverage`
making it part of the package help documentation and can be viewed as an
[article](https://yonicd.github.io/covrpage/articles/tests_and_coverage.html)
in a [pkgdown](https://github.com/r-lib/pkgdown) site.

## Articles

- [Getting
  Started](https://yonicd.github.io/covrpage/articles/get-started.html)
- [How to read the
  report](https://yonicd.github.io/covrpage/articles/how-to-read-covrpage-report.html)
- [Test
  Results](https://yonicd.github.io/covrpage/articles/Test_Results.html)
- [Continuous
  Integration](https://yonicd.github.io/covrpage/articles/Continuous_Integration.html)

## Repositories using covrpage

- [slackr](https://github.com/hrbrmstr/slackr/tree/master/tests)
- [remedy](https://github.com/thinkr-open/remedy/tree/master/tests)
- [mathpix](https://github.com/jonocarroll/mathpix/tree/master/tests)
- [carbonate](https://github.com/yonicd/carbonate/tree/master/tests)
- [GSEAdv](https://github.com/llrs/GSEAdv/tree/master/tests)
- [rfm](https://github.com/rsquaredacademy/rfm/tree/master/tests)
- [ggstatsplot](https://github.com/IndrajeetPatil/ggstatsplot/tree/master/tests)
- [Full
  List…](https://github.com/search?l=Markdown&o=desc&q=covrpage+filename%3AREADME.md+path%3Atests&s=indexed&type=Code)

If you also have `covrpage` on your site and want to add it to the list
you can submit a [Pull
Request](https://github.com/yonicd/covrpage/pulls?utf8=%E2%9C%93&q=is%3Apr)
to this README.

## Contributing

[Locke Data](https://itsalocke.com) contributed code and creative input
into this package as part of their ongoing [support
offer](https://itsalocke.com/blog/package-support-offer/) designed to
help boost the R ecosystem and support open source contributors. All
rights associated with the work are granted to the copyright holder of
this package.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

Any questions/comments are always welcome in the
[issues](https://github.com/yonicd/covrpage/issues) section.
