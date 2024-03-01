#' Retrieve all available ArcGIS boundary layers
#' from the ONS Open Geography Portal
#' 
#' @returns list of avvailable boundary layers on ArcGIS
#' 
#' @examples 
#' list_boundaries()
#' @export

list_boundaries <- function(){
  
  base_url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/"
  
  x <- {httr::GET(paste0(base_url,
                               "?f=pjson"))%>%
    httr::content()}$services
  
  boundaries <- c()
  
  for(i in x){
    boundaries <- c(boundaries, i[["name"]])
    
  }
  return(boundaries)
}





