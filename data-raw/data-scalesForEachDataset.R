#Generate master dataset showing all of the available boundary scales for the tables in "nomisTables.rda"

createDataset <- function() {
  scales <- data.frame()
  for (i in sgApi::nomisTables$id) {
    print(i)
    try({
      x <- sgApi::availableScales(i)
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

scalesForEachDataset <- createDataset()
usethis::use_data(scalesForEachDataset, overwrite = TRUE)
