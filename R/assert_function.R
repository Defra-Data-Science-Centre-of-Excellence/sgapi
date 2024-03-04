#' Evaluate conditrion and return error message if confdition not satisfied. 
#' 
#' @param condition a logical expresssion (e.g. is.null(test_variable))
#' @param msg the error message returned if the condition is not met.
#' 
#' @examples 
#' assert_function(1==2,"Incorrect inequality")
#' 
#' @returns returns tidy dataframe of selected NOMIS table with the selected parameters and user filters applied
#' @export

assert_function <- function(condition,msg){
  if(condition) {
    stop(msg)
  }
}