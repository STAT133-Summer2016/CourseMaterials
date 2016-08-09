library(stringr)
library(lubridate)

shinyServer(function(input, output, session) {
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    str_c("The current time is ", now())
  })
})
