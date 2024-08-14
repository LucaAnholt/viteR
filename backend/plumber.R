# plumber.R

source("./utils/yyjsonr_serialiser.R")

#* Echo back the input
#* @param msg The message to echo
#* @get /
#* @serializer yyjsonr
#* 
function(msg="") {
  list("Welcome to root")
}