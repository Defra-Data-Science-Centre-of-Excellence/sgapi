#' Retrieve summary information about
#' a given NOMIS dataset. 
#' 
#' @importFrom magrittr %>%
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
  #assert_function(raw_info$status_code>=400L, paste0("API has failed, review the filters applied. The status code is: ",raw_info$status_code))
  return(raw_info)
}
