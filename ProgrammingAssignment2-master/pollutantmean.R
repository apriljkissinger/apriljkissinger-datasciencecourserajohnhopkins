rm(list = ls()) ## Removes all objects from the workspace

pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of  the pollutant for which we will calcultate the
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result
  
  means <- c()
  
  for (i in id){
    
    ## see info on sprintf below
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "") 
    monitor_data <- read.csv(path)
    interested_data <- monitor_data[pollutant]
    means <- c(means, interested_data[!is.na(interested_data)])
    
  }
  
  mean(means)
  
}


## sprintf is a wrapper for the C function. returns a character vector containing a formatted combo of tect & variables
## %03d this was copied from the internet where there was a 7 instead of an i
##d stands for decimal integer (not double!), so it says there will be no floating point or anything like that, just a regular integer.
##3 shows how many digits will the printed number have. More precisely, the number will take at least 3 digits: 7 will be __7 (with spaces instead of underscores), but 1000 will remain 1000, as there is no way to write this number with just 3 digits.
##0 before 3 shows that leading spaces should be replaced by zeroes. Try experimenting with sprintf("%+3d", 7), sprintf("%-3d", 7) to see other possible modifiers (they are called flags).
## i is the index in the for loop




