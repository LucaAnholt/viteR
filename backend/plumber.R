# plumber.R

##import custom yyjsonr serialiser 
source("./utils/yyjsonr_serialiser.R")

#* static files
#* @assets ./dist /
list()

#* api root
#* @get /api
#* @serializer yyjsonr
#* 
function() {
  list("Welcome to API root")
}