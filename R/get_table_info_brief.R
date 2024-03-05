#' Retrieve summary information about
#' a given NOMIS dataset. This is
#' useful as it provides the descripion 
#' of the dataset and any caveats
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
  tryCatch(
    {
      base_url = "https://www.nomisweb.co.uk/api/v01/"
      raw_info <- httr::GET(paste0(base_url,
                                  "dataset/",
                                   id,
                                  ".overview.json?select=DatasetInfo,DatasetMetadata,Dimensions,Codes-workforce,Contact,Units")) %>%
      httr::content()
    return(raw_info)
    },
  error = function(e) {
    message("Chosen Nomis table id does not exist, see column 'id' in sgapi::nomisTables for available table ids")
    print(e)
  }
  )

}
