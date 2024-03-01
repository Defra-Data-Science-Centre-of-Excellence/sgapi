#' Retrieve a NOMIS table using a given table ID. 
#' 
#' @param id a table ID recognised by NOMIS (e.g. "NM_1_1")
#' @param options a list of paramaters to pass to the API query.
#' @param selection a vector of column names to return. NULL returns all.  
#' 
#' @examples 
#' getTable("NM_1_1", options = list("geography" = "TYPE480", "time" = "latest"))
#' 
#' @returns returns tidy dataframe of selected NOMIS table with the selected parameters and user filters applied

get_table <- function(id,
                     options = list(...),
                     selection = NULL,
                     uid = NULL){
  baseUrl = "https://www.nomisweb.co.uk/api/v01/"
  
  #assertFunction(is.null(layers), "selectedBoundary is not a valid boundary, see https://geoportal.statistics.gov.uk/ for available boundaries")
  
  if (!is.null(uid)){
    uid_link=paste0("&uid=",uid)
  }
  else{
    uid_link=""
  }
  queries <- c()
  for(i in names(options)){
    if(i=="time"){new_i="date"}
    else{new_i = i}
    query <- paste0(new_i,"=", options[[i]])
    queries <- c(queries, query)
  }
  total_queries <- paste0(queries, collapse = "&")
  
  if(!is.null(selection)){
    select_query <- paste0(selection, collapse = ",")
    x <- httr::GET(paste0(
      baseUrl,
      "dataset/",
      id,
      ".data.csv?",
      total_queries,
      "&select=",
      select_query,
      uid_link))
  }else{
    x <- httr::GET(paste0(
      baseUrl,
      "dataset/",
      id,
      ".data.csv?",
      total_queries,
      uid_link))
  }
  assert_function(x$status_code>=400L, paste0("API has failed, review the filters applied. The status code is: ",x$status_code))
  print(paste0("STATUS CODE: ",x$status_code))
  return(httr::content(x))
  
}

