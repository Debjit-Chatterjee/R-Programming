pollutantmean <- function(directory, pollutant, id = 1:332){
  
  file_list <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  
  finding_mean <- numeric()
  
  for(i in id){
    
    mydata <- read.csv(file_list[i])
    finding_mean <- c(finding_mean, mydata[[pollutant]])
    
  }
  
  mean_of_pollutant <- mean(finding_mean[!is.na(finding_mean)])
  
  mean_of_pollutant
  
}