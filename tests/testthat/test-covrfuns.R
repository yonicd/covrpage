testthat::context("check summary covr")

testthat::describe("covr_summary", {
  it("standard input", {
    testthat::expect_s3_class(covrpage::covr_summary(covrpage:::covr_test), "data.frame")
  })

  it("empty input", {
    testthat::expect_error({
      covrpage::covr_summary()
      })
  })
})

testthat::context("check summary output types")

testthat::describe("with data", {
  it("short", {
    testthat::expect_s3_class(covrpage::testthat_summary(covrpage:::testthat_test, "short"), "data.frame")
  })

  it("long", {
    testthat::expect_s3_class(covrpage::testthat_summary(covrpage:::testthat_test, "long"), "data.frame")
  })

  it("no data", {
    testthat::expect_null(covrpage::testthat_summary(covrpage:::testthat_test, "something"))
  })
})

testthat::context("check covr to df")

testthat::describe("covr object to df", {
  it("empty input", {
    testthat::expect_null(covrpage:::covr_print_to_df(c()))
  })
})
