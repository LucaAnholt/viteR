library(plumber)
# load router
r <- plumber::plumb("./plumber.R")

# start application
r$run(host="0.0.0.0", 
      port = 8080,
      swagger = FALSE)