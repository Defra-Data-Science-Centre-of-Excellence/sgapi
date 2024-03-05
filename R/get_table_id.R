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
    )) %>%
    httr::content()
  assert_function(length(raw_data$structure$keyfamilies)==2L,"No tables with chosen name")
  
  num_files=length(raw_data$structure$keyfamilies$keyfamily)
  message(paste0(num_files," table names contain your selected charater string"))
  d_rows <- data.frame()
  for (i in seq_along(raw_data$structure$keyfamilies$keyfamily)) {
    d_row <- data.frame(dn = i,
                        n = raw_data$structure$keyfamilies$keyfamily[[i]]$id,
                        v = raw_data$structure$keyfamilies$keyfamily[[i]]$name$value)
    d_rows <- dplyr::bind_rows(d_rows, d_row)
  }
  return(d_rows)
}
