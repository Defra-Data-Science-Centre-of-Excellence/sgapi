#' Retrieve boundaries from the ONS Geography Portal
#' given a valid boundary name and layer name.
#'
#' @param boundary A valid boundary name given as a string
#' @param layer A valid layer given as an integer (defaults to 0)
#' @param geometry_filter geospatial shape or point (using latitude and longitude) Currently limited to a rectangular box or dropped pin
#'
#' @examples 
#' getBoundaries("Middle_Super_Output_Areas_December_2011_Boundaries/",0,"-1.282825,52.354169,0.206626,52.7106")
#' 
#' @returns Shapefile of all constituencies in the geospatial area submitted through the geometryFilter, at the chosen ONS Boundary
#' export

get_boundaries <- function(boundary,
                          layer,
                          geometry_filter = NULL) {
  base_url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/"

  output_fields="*"
 
  if (is.null(geometry_filter)) {
    spatial_object <- sf::st_read(
      paste0(
        base_url,
        boundary,
        "/FeatureServer/",
        layer,
        "/query?where=1%3D1&outFields=",
        output_fields,
        "&outSR=4326&geometryPrecision=3&f=geojson"
      )
    )
  } else{
    i <- 0
    x <- TRUE
    spatial_object <- sf::st_set_crs(sf::st_sf(sf::st_sfc()), value = "WGS84")
    while (x == TRUE)
    {
      result_offset <- i * 200 #this is used move through the dataset as you loop through the different spatial areas
      
      new_sf <- sf::st_read(
        paste0(
          base_url,
          boundary,
          "/FeatureServer/",
          layer,
          "/query?where=1%3D1&outFields=",
          output_fields,
          "&geometry=",
          geometry_filter,
          "&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelIntersects&outSR=4326&geometryPrecision=3&",
          "resultOffset=",
          result_offset, 
          "&",
          "f=geojson"
        )
      )
      
      if (length(new_sf$geometry) == 0) {
        x <- FALSE
      } else{
        spatial_object <- rbind(spatial_object, new_sf)
        i <- i + 1
      }
    }
  }
  
  return(spatial_object)
}

