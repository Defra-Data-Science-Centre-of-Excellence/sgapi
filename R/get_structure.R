#' Retrieve dataset overview
#' for a valid NOMIS table id
#' @importFrom magrittr %>%
#' 
#' @param id A valid NOMIS id.
#' @param dim The name of the g which dimension is queried.
#' 
#' @examples 
#' get_structure(id="NM_187_1",dim="industry")
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

      assert_function(length(raw_data)==2L,paste0("Chosen Nomis table id '",id, "' is invalid see column 'id' in sgapi::nomisTables for available table ids"))
      assert_function(is.null(raw_data$structure$codelists$codelist),paste0("Chosen dimension does not exist for this nomis table, run get_overview(","'",id,"'",") to retrieve all of the available dimensions for this table"))
      return(raw_data)
    },
    error = function(e) {
      message("Chosen Nomis table id or dimension does not exist, see column 'id' in sgapi::nomisTables for available table ids")
      print(e)
  }
  )
}
