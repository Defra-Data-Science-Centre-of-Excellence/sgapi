DESCRIPTION <- yaml.load_file("DESCRIPTION")

#' @title Write bespoke sgapi message
#'
#' @description
#' Write message prefixed with '[sgapi-{version}] '
#' 
#' @import yaml
#'
#' @param ... Message to be printed, passed directly to 'message'
#' with prefix at front
#'
#' @examples
#' sgapi_message("Some message for the user")
#' [sgapi-1.1.0] Some message for the user
#'
#' @returns NULL
#' 
#' @export

sgapi_message <- function(...) {
  message(sprintf("[sgapi-%s] ", DESCRIPTION$Version), ...)
}
