#Generate master dataset showing all of the available boundary scales for the tables in "nomisTables.rda"

create_dataset <- function() {
  scales <- data.frame()
  for (i in nomisTables$id) {
    print(i)
    try({
      x <- available_scales(i)
      if (class(x) == "character") {
        x <- data.frame(name = x,
                        value = x)
      }
      z <- dplyr::mutate(x, table = i)
      scales <- dplyr::bind_rows(scales, z)
    })
  }
  return(scales)
}

scalesForEachDataset <- create_dataset()
usethis::use_data(scalesForEachDataset, overwrite = TRUE)
