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
  raw_data <- httr::GET(paste0(base_url, "/?f=pjson")) |> httr::content()

  return(unlist(lapply(raw_data$services, function(x) x[["name"]])))
}

