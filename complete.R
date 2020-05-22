complete <- function(directory,id = 1:332){
  
  file_list <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  como <- numeric()
  for(i in id)
  {
    mydata <- read.csv(file_list[i])
    complete_my_data <- mydata[!is.na(mydata$sulfate) & !is.na(mydata$nitrate), ]
    como <- c(como, nrow(complete_my_data))
  }
  complete_data <- data.frame(id = id, nobs = como)
  complete_data
  
}