#' Extract unique table id - this is used to 
#' rapidly query census data in other functions
#' 
#' @import xml2
#' 
#' 
#' 
#' @param name A valid NOMIS table name given as a string
#' @param base_url Base url for the api being queried
#' 
#' @examples get_table_id("RM003 - Accommodation type by type of central heating in household by tenure")
#' @returns The unique table code that allows rapid querying of the data e.g. "NM_102_1"
#' @export

get_table_id <- function(name,
                    base_url = "https://www.nomisweb.co.uk/api/v01/"){
  raw_data <- httr::GET(
    paste0(
      base_url,
      "dataset/def.sdmx.json?search=name-*",
      name,
      "*"
    ))
  #print(raw_data$overview$)
  #assert_function(raw_data$status_code>=400L, paste0("API has failed, check that the 'name' of the table is spelled correctly. The status code is: ",raw_data$status_code))
  assert_function(is.null(raw_data$structure$keyfamilies),"No tables with chosen name")
  return(httr::content(raw_data)$structure$keyfamilies$keyfamily[[1]]$id)
}
