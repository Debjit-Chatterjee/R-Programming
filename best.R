best <- function(state, outcome) {
  
  data <- read.csv("outcome-of-care-measures.csv")
  if(tolower(outcome) == 'heart attack') {
    mycol <- 11
  }
  if(tolower(outcome) == 'heart failure') {
    mycol <- 17
  }
  if(tolower(outcome) == 'pneumonia') {
    mycol <- 23
  }
  stateHospitals <- subset(data, data$State == state)
  min_rate <- min( as.numeric(stateHospitals[, mycol]), na.rm = TRUE)
  bestHospitalList <- subset(stateHospitals, as.numeric(stateHospitals[, mycol]) == min_rate)
  bestHospitalLIst <- sort(bestHospitalList$Hospital.Name)
  
  bestHospitalLIst[1]
  
}
