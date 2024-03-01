#' Return a list of data sources available on NOMIS
#'
#' Returns a list including the name and id of each
#' data source available on NOMIS.
#'
#' @examples
#' dataSources()
#' 
#' @returns List of all availbale datasources accessible through the Nomis API system. More information can be found here: https://www.nomisweb.co.uk/api/v01/help
#' @export

data_sources <- function() {
  y <-
    httr::GET("https://www.nomisweb.co.uk/api/v01/contenttype/sources.json") %>%
    httr::content()
  
  is_nested <- function(l) {
    stopifnot(is.list(l))
    for (i in l) {
      if (is.list(i))
        return(TRUE)
    }
    return(FALSE)
  }
  
  sources <- data.frame()
  for (i in c(1:length(y$contenttype$item))) {
    if (!(is_nested(y$contenttype$item[[i]]))) {
      source <-
        data.frame(
          source_name = y$contenttype$item[[i]]$name,
          source_id = y$contenttype$item[[i]]$id
        )
    } else{
      source <- data.frame()
      for (j in c(1:length(y$contenttype$item[[i]]$item))) {
        if (!(is_nested(y$contenttype$item[[i]]$item[[j]]))) {
          sub_group_source <-
            data.frame(
              source_name = y$contenttype$item[[i]]$item[[j]]$name,
              source_id = y$contenttype$item[[i]]$item[[j]]$id
            )
        }else{
          for(z in c(1:length(y$contenttype$item[[i]]$item[[j]]$item))){
            sub_group_source <- data.frame(
              source_name = y$contenttype$item[[i]]$item[[j]]$item[[z]]$name,
              source_id = y$contenttype$item[[i]]$item[[j]]$item[[z]]$id
            )
          }
        }
        print(j)
        
        
        source <- dplyr::bind_rows(source, subGroupSource)
      }
    }
    
    
    sources <- dplyr::bind_rows(sources, source)
  }
  # sources <- sources %>%
  #   dplyr::mutate(sourceId = dplyr::case_when(sourceId == "census" ~ "census-release",
  #                                             sourceId == "dwp" ~ "dwp-release",
  #                                             TRUE ~ sourceId))
  return(sources)
}
