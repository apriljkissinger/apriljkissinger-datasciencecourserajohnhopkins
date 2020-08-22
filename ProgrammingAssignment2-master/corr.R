rm(list = ls()) ## Removes all objects from the workspace

corr <- function(directory, threshold = 0){
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the 
        ## number of completely observed observations (on all
        ## variables) requi?red to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
        
        cor_results <- numeric(0)
        
        completed_cases <- complete(directory)
        completed_cases <- completed_cases[completed_cases$nodeamt >= threshold, ]

        if (nrow(completed_cases) > 0){
                for (i in completed_cases$id){
                        data <- read.csv(filelist[i])
                        data_noNA <- data[complete.cases(data),] 
                        sulfate_data <- data_noNA["sulfate"]
                        nitrate_data <- data_noNA["nitrate"]
                        cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
                }
                cor_results
        }
 
}




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
