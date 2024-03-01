#' Retrieve summary information about
#' a given NOMIS dataset. 
#' 
#' @param id A valid NOMIS table id given as a string, e.g. NM_46_1
#' 
#' @examples get_table_info_brief("NM_1_1")
#' 
#' @returns A json file containing the DatasetInfo, DatasetMetadata, Dimensions (variables), Dataset Contact,Units
#' @export

get_table_info_brief <- function(id){
  
  base_url = "https://www.nomisweb.co.uk/api/v01/"
  raw_info <- httr::GET(paste0(base_url,
                              "dataset/",
                              id,
                              ".overview.json?select=DatasetInfo,DatasetMetadata,Dimensions,Codes-workforce,Contact,Units")) %>%
    httr::content()
  return(raw_info)
}
