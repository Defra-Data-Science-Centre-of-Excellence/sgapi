#' Retrieve availabe layers for a valid boundary
#' from the ONS Open Geography Portal
#' 
#' @param selected_boundary A valid boundary from the ONS Open Geography Portal
#' 
#' @examples extract_layers("Middle_Super_Output_Areas_2011_Boundaries")
#' @returns Returns a two dimensional dataframe giving the names and IDs of tables available at the chosen boundary scale.
#' @export

extract_layers <- function(selected_boundary){
    base_url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/"

  layers <- {httr::GET(paste0(baseUrl,
                              selected_boundary,
                              "/FeatureServer/",
                              "?f=pjson")) %>%
      httr::content() %>%
      jsonlite::fromJSON()}$layers %>%
    dplyr::select(id, name)
  assert_function(is.null(layers), "selectedBoundary is not a valid boundary, see https://geoportal.statistics.gov.uk/ for available boundaries")
  
  return(layers)
}
