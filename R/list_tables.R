#' @title Available 'nomis' Tables
#'
#' @description
#' List all available datasets on 'nomis'. 
#' User can then use the items on this list to query 'nomis' data.
#' 
#' @param base_url Url of the API from which the available tables are listed.
#' 
#' @returns A tidy dataframe containing
#' the name and ID of each table available on 'nomis'.
#' 
#' @export


list_tables <- function(base_url = "https://www.nomisweb.co.uk/api/v01/"){
  
  y <- httr::GET("https://www.nomisweb.co.uk/api/v01/dataset/def.sdmx.json") %>%
    httr::content()

	nomis_names <- unlist(map(y$structure$keyfamilies$keyfamily, function (x) x[["name"]]$value))
	nomis_ids <- unlist(map(y$structure$keyfamilies$keyfamily, function (x) x[["id"]]))

	return(data.frame(name = nomis_names, id = nomis_ids))
}
