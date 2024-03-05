  test_that("Error is returned for invalid table id", {
    expect_message(get_overview("N_1002_1"))
  }
  )
  
  test_that("No error is returned for valid table id", {
    expect_no_message(get_overview("NM_1022_1"))
  }
  )
  
  
  test_that("Error is returned for invalid table id", {
    expect_message(get_table_info_brief("02_1"))
  }
  )
  
  test_that("No error is returned for valid table id", {
    expect_no_message(get_table_info_brief("NM_42_1"))
  }
  )