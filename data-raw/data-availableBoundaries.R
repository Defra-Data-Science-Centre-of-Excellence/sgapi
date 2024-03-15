#' Writes a dataframe produced by 'list_table()' to a .rda file

availableBoundaries <- list_boundaries()
usethis::use_data(availableBoundaries, overwrite = TRUE)
