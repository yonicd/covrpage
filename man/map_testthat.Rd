% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map_testthat.R
\name{map_testthat}
\alias{map_testthat}
\title{Map the hierarchy structure of testthat directory}
\usage{
map_testthat(path = "tests/testthat")
}
\arguments{
\item{path}{character, path to tests, Default: 'tests/testthat'}
}
\value{
data.frame
}
\description{
Query a testthat directory for the unit test structure.
}
\details{
Return data.frame containing which expecations are in the testthat directory
 by file/context/description/test/expectation/linerange
}
\seealso{
\code{\link[stats]{setNames}}

Other utility: 
\code{\link{coverage_skip}()},
\code{\link{covr_summary}()},
\code{\link{map_testthat_snapshot}()},
\code{\link{map_test}()},
\code{\link{package_name}()},
\code{\link{testthat_summary}()}
}
\concept{utility}
