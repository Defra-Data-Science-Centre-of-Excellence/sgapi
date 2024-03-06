test_that("Valid table ID returns a vector", {
 expect_no_error(get_table("NM_1_1", options = list("geography" = "TYPE480", "time" = "latest")))
}
         )


test_that("Valid query returning over 25,000 rows sends a warning", {
  expect_warning(get_table("NM_105_1", options = paste0("time" = "latest")))
}
)

test_that("Valid table ID returns a vector", {
  expect_no_error(get_table("NM_1002_1", options = list("geography" = "TYPE265", "time" = "latest")))
}
)

test_that("Valid table ID returns a vector", {
  expect_no_error(get_table(id="NM_1002_1", options = list("geography" = "TYPE265", "time" = "latest"),selection = "GEOGRAPHY_NAME,C_AGE_NAME,OBS_VALUE"))
}
)

test_that("Valid table ID returns a list", {
  expect_type(get_table(id="NM_1002_1", options = list("geography" = "TYPE265", "time" = "latest"),selection = "GEOGRAPHY_NAME,C_AGE_NAME,OBS_VALUE"),"list")
}
)


test_that("Invalid table ID returns an error message", {
  expect_error(get_table("A_1_1", options = list("geography" = "TYPE480", "time" = "latest")))
}
)
