rankall <- function(outcome, num = "best") {
  
  data <- read.csv("outcome-of-care-measures.csv")
  state <- unique(data$State)
  state <- sort(state)
  hospital <- character()
  for(i in state) {
    hospital <- c(hospital, rankhospital(i, outcome, num))
  }
  countryBestHospitals <- data.frame(hospital = hospital, state = state)
  
  countryBestHospitals
}