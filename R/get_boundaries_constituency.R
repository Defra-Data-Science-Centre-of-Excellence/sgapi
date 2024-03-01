#' Extract a geojson file of our chosen constituencies
#' 
#' @param boundary The resolution of constituencies, e.g. Census Output areas or Westminster Constituencies. Available boundaries can be found here: https://geoportal.statistics.gov.uk/ 
#' @param layer This is equal to 0
#' @param col_name_var The name of the datafield where the constituency name is held, e.g. PCON22NM for 2022 Parliamentary Constituencies
#' @param chosen_constituency_list List of chosen constituencies
#' 
#' @examples getBoundaries_Constituency("Local_Authority_Districts_December_2022_UK_BGC_V2")
#' 
#' @returns A geojson spatial file of the constituencies submitted to the function
#' @export

get_boundaries_constituency <- function(boundary,
                                            layer,
                                            col_name_var,
                                            chosen_constituency_list) {
  
  if(boundary=="Wards_December_2022_Boundaries_UK_BGC"){
    output_fields="WD22CD,WD22NM,BNG_E,BNG_N,LONG,LAT,Shape_Leng,OBJECTID,Shape__Area,Shape__Length,GlobalID"}
    else {
      output_fields="*"
    }
  
  base_url = "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/"
  api_list_constituencies = ''
  for (i in 1:length(chosen_constituency_list)) {
    if (i < length(chosen_constituency_list)) {
      api_list_constituencies <- paste0(api_list_constituencies,chosen_constituency_list[i],"'%20OR%20",col_name_var,"%20%3D%20'")}
    else {
      api_list_constituencies <- paste0(api_list_constituencies,chosen_constituency_list[i],"')%20")
    }
  }
  
  full_api_link <-paste0(
    base_url,
    boundary,
    "/FeatureServer/",
    layer,
    "/query?where=%20(",
    col_name_var,
    "%20%3D%20'",
    api_list_constituencies,
    "&",
    "outFields=",
    output_fields,
    "&outSR=4326&f=geojson"
  )
  spatial_object <- sf::st_read(full_api_link)
  return(spatial_object)
}