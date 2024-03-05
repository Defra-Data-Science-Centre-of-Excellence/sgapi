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
  tryCatch(
    {
      base_url = "https://www.nomisweb.co.uk/api/v01/"
      raw_data <- httr::GET(paste0(base_url,
                      "dataset/",
                      id,
                      "/",
                      dim,
                      ".def.sdmx.json")) %>%
      httr::content()
      return(raw_data)
    },
    error = function(e) {
      message("Chosen Nomis table id or dimension does not exist, see column 'id' in sgapi::nomisTables for available table ids")
      print(e)
  }
  )
}
