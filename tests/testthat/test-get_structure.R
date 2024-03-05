test_that("Error is returned for invalid table id", {
  expect_message(get_structure("N_187_1","industry"))
}
)

test_that("No error is returned for valid table id", {
  expect_no_message(get_structure("NM_187_1","industry"))
}
)