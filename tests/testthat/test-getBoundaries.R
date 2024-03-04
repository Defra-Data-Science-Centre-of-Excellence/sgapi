test_that("A valid boundary returns a list", {
  expect_type(get_boundaries("MSOA_Dec_2011_Boundaries_Generalised_Clipped_BGC_EW_V3_2022","-1.282825,52.354169,0.206626,52.7106"), "list")
})