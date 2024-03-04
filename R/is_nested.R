#' Function to test if list
#' is nested
#' #' 
#' @importFrom methods is
#' 
#' @param l fragment of json file to test
#' 
#' @returns Boolean indicating whether input was nested or not
#' 
#' @export
#' 
is_nested <- function(l) {
  stopifnot(is.list(l))
  for (i in l) {
    if (is.list(i))
      return(TRUE)
  }
  return(FALSE)
}