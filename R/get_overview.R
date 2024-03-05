#' Retrieve dataset overview
#' for a valid NOMIS table id
#' @importFrom magrittr %>%
#' 
#' @param id A valid NOMIS id.
#' 
#' @examples 
#' get_overview("NM_1_1")
#' @returns json file with overview information of chosen data set - including description of the dataset, last update date, contact for the data
#' @export

get_overview <- function(id) {
  tryCatch(
    {
      base_url = "https://www.nomisweb.co.uk/api/v01/"
      raw_data <- httr::GET(paste0(base_url,
                       "dataset/",
                       id,
                       ".overview.json")) %>%
                       httr::content()
      return(raw_data)
    },
    error = function(e) {
      message("Chosen Nomis table id does not exist, see column 'id' in sgapi::nomisTables for available table ids. If table is recorded in sgapi::nomisTables, contact nomis to check for any know issues with the dataset")
      print(e)
  }
  )
}
