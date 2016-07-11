last_name  <- "Do"
first_name <- "Andrew"
birthday   <- "8/28/1994"

CheckEvaluation <- function(x, y, z) {
  system_info <- Sys.info()
  wd <- getwd()
  return(c(last_name  = x, 
           first_name = y, 
           birthday   = z,
           directory  = wd,
           time = Sys.time(),
           system_info))
}

my_data <- CheckEvaluation(last_name, first_name, birthday)

save(my_data, file = "evaluator.rda")
