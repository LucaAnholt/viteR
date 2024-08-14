# Load necessary libraries
library(yyjsonr)
library(plumber)

#' serialiser_yyjsonr 
#' 
#' @description 
#' custom JSON serialiser using the {yyjsonr} package for fast JSON serialisation
#' 
#' @param ... arguments passed onto yyjsonr::write_json_str()
#' @param type string/character - defines serialisation return type i.e. 
#' "application/json"
#'
#' @return string/character representing the JSON serialized data
#' @export
#' @importFrom yyjsonr write_json_str
#' 
serialiser_yyjsonr <- function(..., type = "application/json") {
  plumber:::serializer_content_type(type, function(val) {
    tryCatch({
      yyjsonr::write_json_str(val, ...)
    }, error = function(e) {
      stop("yyjsonr serialization failed: ", e$message)
    })
  })
}

plumber::register_serializer(name = "yyjsonr", serializer = serialiser_yyjsonr)
