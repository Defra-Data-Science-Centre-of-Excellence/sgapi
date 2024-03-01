#' List all available datasets on NOMIS
#' 
#' @returns data frame containing
#' the name and ID of each table
#' 
#' @examples list_tables()
#' @export


list_tables <- function(base_url = "https://www.nomisweb.co.uk/api/v01/"){
  
  y <- httr::GET("https://www.nomisweb.co.uk/api/v01/dataset/def.sdmx.json") %>%
    httr::content() 
  
  available_datasets <- data.frame()
  for(i in 1:length(y$structure$keyfamilies$keyfamily)){
    available_datasets <- rbind(available_datasets,
                               data.frame(
                                 name = y$structure$keyfamilies$keyfamily[[i]]$name$value,
                                 id = y$structure$keyfamilies$keyfamily[[i]]$id)
    )
  }
  
  return(available_datasets)
}
