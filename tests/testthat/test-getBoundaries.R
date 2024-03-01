test_that("A valid boundary returns a list", {
  expect_type(getBoundaries("WPC_Dec_2020_UK_BGC_2022", 0), "list")
})