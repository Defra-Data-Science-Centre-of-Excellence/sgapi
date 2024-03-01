test_that("A valid boundary returns a list", {
  expect_type(extractLayers("WPC_Dec_2020_UK_BGC_2022"), "list")
})