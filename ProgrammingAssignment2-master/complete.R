rm(list = ls()) ## Removes all objects from the workspace

complete <- function(directory, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the from:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  results <- data.frame(id = numeric(0), nodeamt = numeric(0))
  
  for (i in id) {
    
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    file_data <- read.csv(path)
    file_data_noNA <- file_data[complete.cases(file_data),] #This was my try
    # file_data_noNA <- file_data[(!is.na(file_data$sulfate)), ]
    # file_data_noNA <- file_data_noNA[(!is.na(file_data_noNA$nitrate)), ]
    nodeamt <- nrow(file_data_noNA)
    results <- rbind(results, data.frame(id=i, nodeamt=nodeamt))
  } 
  
  results
  
}
