#' Retrieve dataset overview
#' for a valid NOMIS table id
#' @importFrom magrittr %>%
#' 
#' @param id A valid NOMIS id.
#' @param dim The name of the g which dimension is queried.
#' 
#' @examples 
#' get_structure("NM_187_1","industry")
#' @export

get_structure <- function(id,dim) {
  
  base_url = "https://www.nomisweb.co.uk/api/v01/"
  raw_data <- httr::GET(paste0(base_url,
                   "dataset/",
                   id,
                   "/",
                   dim,
                   ".def.sdmx.json")) %>%
    httr::content()
  #assert_function(raw_data$status_code>=400L, paste0("API has failed, review the filters applied. The status code is: ",raw_data$status_code))
  return(raw_data)
}
