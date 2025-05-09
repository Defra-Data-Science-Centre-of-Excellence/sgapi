#' Retrieve all available 'nomis' tables
#' 
#' @returns A dataframe of all available table codes and names, written to to an .rda file


library(dplyr)
nomisTables <- list_tables()

extract_data_source <- function() {
  
  sources <- data.frame()
  for (i in {
    nomisTables[nomisTables$id != "NM_45_1" & nomisTables$id != "NM_2064_1", "id"]
  }) {
    
    
    x <- get_overview(i)
    
    is_nested <- function(l) {
      stopifnot(is.list(l))
      for (i in l) {
        if (is.list(i))
          return(TRUE)
      }
      return(FALSE)
    }
    
    
    if (is.list(x$overview$contenttypes$contenttype)) {
      if (is_nested(x$overview$contenttypes$contenttype)) {
        for (j in c(1:length(x$overview$contenttypes$contenttype))) {
          print(j)
          if (x$overview$contenttypes$contenttype[[j]]$id == "sources") {
            source <-
              data.frame(
                sourceName = x$overview$contenttypes$contenttype[[j]]$value,
                id = i
              )
            
          }
        }
        sources <- dplyr::bind_rows(source, sources)
      } else{
        source <-
          data.frame(
            sourceName = x$overview$contenttypes$contenttype$value,
            id = i
          )
        sources <- dplyr::bind_rows(source, sources)
        
      }
    } else{
      
      source <- data.frame(sourceName = x$overview$contact$name,
                           id = i)
      sources <- dplyr::bind_rows(source, sources)
    }
    
    
    
  }
  return(sources)
}

sources <- extract_data_source()

nomisTables <- dplyr::left_join(nomisTables,sources, by = "id")

usethis::use_data(nomisTables, overwrite = TRUE)
