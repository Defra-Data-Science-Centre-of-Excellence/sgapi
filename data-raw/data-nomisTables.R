library(dplyr)
nomisTables <- sgApi::listTables()

extractDataSource <- function() {
  
  sources <- data.frame()
  for (i in {
    #sgApi::
     nomisTables %>% dplyr::filter(id != "NM_45_1") %>% dplyr::filter(id != "NM_2064_1") %>% dplyr::pull("id")
  }) {
    print(i)
    
    
    x <- getOverview(i)
    
    isNested <- function(l) {
      stopifnot(is.list(l))
      for (i in l) {
        if (is.list(i))
          return(TRUE)
      }
      return(FALSE)
    }
    
    
    if (is.list(x$overview$contenttypes$contenttype)) {
      if (isNested(x$overview$contenttypes$contenttype)) {
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

sources <- extractDataSource()

nomisTables <- dplyr::left_join(nomisTables,sources, by = "id")

usethis::use_data(nomisTables, overwrite = TRUE)