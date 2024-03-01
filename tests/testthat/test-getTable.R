test_that("Valid table ID returns a vector", {
  expect_type(getTable("NM_1_1", options = list("geography" = "TYPE480", "time" = "latest")), "list")
}
          )