#' Extract unique table id - this is used to 
#' rapidly query census data in other functions
#' 
#' @param name A valid NOMIS table name given as a string
#' 
#' @examples table_id("RM003 - Accommodation type by type of central heating in household by tenure")
#' @returns The unique table code that allows rapid querying of the data e.g. "NM_102_1"
#' @export

table_id <- function(name,
                    base_url = "https://www.nomisweb.co.uk/api/v01/"){
  x <- httr::GET(
    paste0(
      base_url,
      "dataset/def.sdmx.json?search=name-*",
      name,
      "*"
    ))
  
  return(httr::content(x)$structure$keyfamilies$keyfamily[[1]]$id)
}
