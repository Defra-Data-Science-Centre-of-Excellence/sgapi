#' Retrieve dataset overview
#' for a valid NOMIS table id
#' 
#' @param id A valid NOMIS id.
#' @param dim An integer determining which dimension is queried.
#' 
#' @examples get_structure("NM_1_1",1)
#' @export

get_structure <- function(id,dim) {
  
  base_url = "https://www.nomisweb.co.uk/api/v01/"
  httr::GET(paste0(base_url,
                   "dataset/",
                   id,
                   "/",
                   dim,
                   ".def.sdmx.json")) %>%
    httr::content()
}
