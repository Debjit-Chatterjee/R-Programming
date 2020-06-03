worst <- function(state, outcome) {
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
  
  max_rate <- max( as.numeric(stateHospitals[, mycol]), na.rm = TRUE)
  
  worstHospitalList <- subset(stateHospitals, as.numeric(stateHospitals[, mycol]) == max_rate)
  
  worstHospitalLIst <- sort(worstHospitalList$Hospital.Name)
  
  worstHospitalLIst[1]
}