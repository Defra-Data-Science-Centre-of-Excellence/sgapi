#' Return a list of data sources available on NOMIS
#'
#' Returns a list including the name and id of each
#' data source available on NOMIS.
#'
#' @examples
#' data_sources()
#' 
#' @returns List of all availbale datasources accessible through the Nomis API system. More information can be found here: https://www.nomisweb.co.uk/api/v01/help
#' @export

data_sources <- function() {
  y <-
    httr::GET("https://www.nomisweb.co.uk/api/v01/contenttype/sources.json") %>%
    httr::content()
  
  sources <- data.frame()
  for (i in seq_along(y$contenttype$item)) {
      source <-
        data.frame(
          source_name = y$contenttype$item[[i]]$name,
          source_id = y$contenttype$item[[i]]$id,
          source_description = y$contenttype$item[[i]]$description
        )

    sources <- dplyr::bind_rows(sources, source)
  }
  
  # sources <- sources %>%
  #   dplyr::mutate(sourceId = dplyr::case_when(sourceId == "census" ~ "census-release",
  #                                             sourceId == "dwp" ~ "dwp-release",
  #                                             TRUE ~ sourceId))
  return(sources)
}


test_df <- data_sources()