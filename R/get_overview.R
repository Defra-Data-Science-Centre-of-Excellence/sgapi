#' Retrieve dataset overview
#' for a valid NOMIS table id
#' 
#' @param id A valid NOMIS id.
#' 
#' @examples 
#' get_overview("NM_1_1")
#' @returns json file with overview information of chosen data set - including description of the dataset, last update date, contact for the data
#' @export

get_overview <- function(id) {
  
  base_url = "https://www.nomisweb.co.uk/api/v01/"
  httr::GET(paste0(base_url,
                   "dataset/",
                   id,
                   ".overview.json")) %>%
    httr::content()
}