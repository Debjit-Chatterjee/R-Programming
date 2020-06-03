rankhospital <- function(state, outcome, num = "best") {
  
  data <- read.csv("outcome-of-care-measures.csv")
  rankedHospital <- character()
  if(num == "best") {
     return(best(state, outcome))
  }
  else if(num == "worst") {
    return(worst(state, outcome))
  }
  else {
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
    orderedIndices <- order(as.numeric(stateHospitals[, mycol]))
    orderedRates <- numeric()
    for(i in orderedIndices) {
      orderedRates <- c(orderedRates, as.numeric(stateHospitals[i, mycol]))
    }
    hospitalNames <- character()
    for(i in orderedIndices) {
      hospitalNames <- c(hospitalNames, stateHospitals[i, "Hospital.Name"])
    }
    orderedIndices <- order(orderedRates, hospitalNames)
    for(i in orderedIndices) {
      rankedHospital <- c(rankedHospital, hospitalNames[i])
    }
   return( rankedHospital[num])
  }
  
}
