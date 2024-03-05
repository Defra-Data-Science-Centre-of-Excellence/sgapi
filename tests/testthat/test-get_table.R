test_that("Valid table ID returns a vector", {
 expect_no_error(get_table("NM_1_1", options = list("geography" = "TYPE480", "time" = "latest")))
}
         )

test_that("Invalid table ID returns an error message", {
  expect_error(get_table("A_1_1", options = list("geography" = "TYPE480", "time" = "latest")))
}
)


