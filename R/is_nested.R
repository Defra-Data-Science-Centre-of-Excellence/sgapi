#' Function to test if list
#' is nested
is_nested <- function(l) {
  stopifnot(is.list(l))
  for (i in l) {
    if (is.list(i))
      return(TRUE)
  }
  return(FALSE)
}