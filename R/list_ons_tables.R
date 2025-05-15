#' @title List all or search ONS data
#'
#' @description
#' List all ONS datasets available through the nomis API or
#' search for datasets matching specific search terms
#' 
#' @import jsonlite
#'
#' @param search Search for a dataset by providing a string 'term' where "*" is
#' a wildcard (e.g. "*claimant*"). Searches can be refined to just the name, 
#' description or keywords (e.g. "name-*claimant*", "description-*jobseeker*"). 
#' Matches are not case-sensitive. If NULL then all tables are returned. 
#' See 'Discover available datasets' section of https://nomisweb.co.uk/api/v01/help
#' for details. Default: NULL
#' @param base_url Url of the API from which the available tables are listed.
#'
#' @examples
#' # Retrieve all available ONS datasets
#' list_ons_tables()
#'
#' # Search for a given search term within name, description or keywords
#' list_ons_tables(search = "*claimants*")
#'
#' # Refine search to specific fields, or add multiple search terms
#' list_ons_tables(search = "description-*jobseeker*")
#' list_ons_tables(search = "name-*jobseeker*,*age*")
#'
#' @returns A dataframe containing the name and ID of each table available on 'nomis'.
#' 
#' @export

list_ons_tables <- function(search = NULL, base_url = "https://www.nomisweb.co.uk/api/v01"){
  nomis_url <- paste0(base_url, "/dataset/def.sdmx.json")
  
  if (!is.null(search)) {
    nomis_url <- sprintf("%s?search=%s", nomis_url, search)
  }

  sgapi_message("Querying Nomis API -> ", nomis_url)
   
  nomis_json <- jsonlite::fromJSON(nomis_url)
  nomis_table <- nomis_json$structure$keyfamilies$keyfamily
  
  if (is.null(nomis_table)) {
    warning(sprintf("No nomis tables matched search '?search=%s'", search))
  }

  return(data.frame(id = nomis_table$id, name = nomis_table$name$value))
}
