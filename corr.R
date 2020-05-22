corr <- function(directory, threshold = 0){
  
  file_list <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  complete_obs <- complete(directory)
  id_list <- complete_obs[complete_obs$nobs > threshold,"id"]
  corelation <- numeric()
  for(i in id_list){
    
    mydata <- read.csv(file_list[i])
    corelation <- c(corelation,cor(mydata$sulfate, mydata$nitrate, use = "pairwise.complete.obs"))
    
  }
  corelation
}