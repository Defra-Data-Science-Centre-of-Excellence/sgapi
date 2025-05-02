#' @title List Available Boundaries
#' 
#' @description
#' Retrieve all available ArcGIS boundary layers
#' from the 'ONS Open Geography Portal'.
#' 
#' @returns A vector of available boundary layers on 'ONS Open Geography'.
#' 
#' @export

list_boundaries <- function(base_url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services") {
  open_geography_url <- paste0(base_url, "/?f=pjson")
  
  message("Querying open geography portal -> ", open_geography_url)
  
  raw_data <- httr::GET(open_geography_url) |> httr::content()
  
  return(unlist(lapply(raw_data$services, function(x) x[["name"]])))
}

