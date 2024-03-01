#' Function to extract the constituency names for the Postcodes/ latitudes and longitudes of the user's uploaded data
#' 
#' @param boundary A valid boundary from the ONS Open Geography Portal
#' @param layer ArgGIS layer - defaults to 0
#' @param column_names name of field containing constituency names
#' @param geometry_filter longitude/latitude coordinates of the point/postcode of interest
#' 
#' @examples get_boundary_names("Westminster_Parliamentary_Constituencies_Dec_2022_UK_BGC",0,"PCON22NM","-1.282825,52.354169,0.206626,52.7106")
#' @returns Returns a list of constituency names corresponding to all of the coordinates submitted
#' @export

get_boundary_names <- function(boundary,
                             layer,
                             column_names, 
                             geometry_filter = NULL) {
  
  ###---Catch statement that checks for errors
  tryCatch(
    {
      ###---the base API url for querying
      base_url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/"
      
      ###---constructs the full URL from the users chosen parameters
      API_Full_Link <- 
        paste0(
          base_url,
          boundary,
          "/FeatureServer/",
          layer,
          "/query?where=1%3D1&outFields=",
          column_names,
          "&geometry=",
          geometry_filter,
          "&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelIntersects&outSR=4326&geometryPrecision=3&",
          "f=json"
          
        )
      
      ###---Queries the API and assigns content to raw_data
      x <- httr::GET(paste0(
        API_Full_Link))
      raw_data <- httr::content(x)
      
      ###---Pulls the desired name of the area from the raw_data and assigns to NM
      nm <- raw_data[["features"]][[1]][["attributes"]][[column_names]]
      
      ###---returns name
      return(nm)
    },
    
    ###---If the query/function returns an error, returns the OUT OF BOUNDS character string instead of breaking
    error = function(e) {
      return('OUT OF BOUNDS')
    }
  )
}