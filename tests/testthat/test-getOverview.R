test_that("A valid table returns a list", {
  expect_type(getOverview("NM_1_1"), "list")
})