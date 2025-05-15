test_that("Verify list_ons_table with no arguments", {
  table_list <- list_ons_tables()

  # Correct column names
  expect_setequal(colnames(table_list), c("name", "id"))

  # Are IDs unique?
  expect_equal(length(unique(table_list$id)), length(table_list$id))

  # Is there data in the data frame?
  expect_gt(dim(table_list)[1], 0)
})

test_that("Verify list_ons_table with simple search argument", {
  table_list <- list_ons_tables(search = "*claimant*")
  # Correct column names
  expect_setequal(colnames(table_list), c("name", "id"))

  # Are IDs unique?
  expect_equal(length(unique(table_list$id)), length(table_list$id))

  # Is there data in the data frame?
  expect_gt(dim(table_list)[1], 0)
})

test_that("Verify list_ons_table with more complicated search argument", {
  table_list <- list_ons_tables(search = "name-*jobseeker*,*age*")
  # Correct column names
  expect_setequal(colnames(table_list), c("name", "id"))

  # Are IDs unique?
  expect_equal(length(unique(table_list$id)), length(table_list$id))

  # Is there data in the data frame?
  expect_gt(dim(table_list)[1], 0)
})

test_that("Verify unsuccessful search gives warning & returns empty dataframe", {
  # Is a warning given when no results returned from search?
  expect_warning(table_list <- list_ons_tables(search = "*xyzabc*"))
  
  # Is an empty dataframe returned?
  expect_equal(length(table_list), 0)
  
})
