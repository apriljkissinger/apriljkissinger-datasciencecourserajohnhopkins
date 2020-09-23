library(dplyr)
library(reshape)

#create file
filename <- "GettingAndCleaningData.zip"

#if filename above does not exist, then downloads the file to filename
if (!file.exists(filename)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, filename, method = "curl")
}

#if UCI HAR Dataset does not exist, unzip the files in filename to this directory
if (!file.exists("UCI HAR Dataset")){
        unzip(filename)
}

#reading data into tables and labeling the columns
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("number","feature"))
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject <- rbind(test_subject, train_subject)
x_set <- rbind(x_test, x_train)
y_set <- rbind(y_test, y_train)
smartlab_data <- cbind(subject, x_set, y_set)

measure_data <- select(smartlab_data, subject, code, grep("mean|std", colnames(smartlab_data), value = TRUE))
measure_data$code <- activities[measure_data$code, 2]

names(measure_data) <- gsub("Acc", "Accelerometer", names(measure_data))
names(measure_data) <- gsub("Gyro", "Gyroscope", names(measure_data))
names(measure_data) <- gsub("mean()", "Mean", names(measure_data))
names(measure_data) <- gsub("std()", "Std", names(measure_data))
names(measure_data) <- gsub("mad()", "MedAbsDev", names(measure_data))
names(measure_data) <- gsub("max()", "Max", names(measure_data))
names(measure_data) <- gsub("min()", "Min", names(measure_data))
names(measure_data) <- gsub("sma()", "Sma", names(measure_data))
names(measure_data) <- gsub("energy()", "Energy", names(measure_data))
names(measure_data) <- gsub("iqr()", "Iqr", names(measure_data))
names(measure_data) <- gsub("entropy()", "Entropy ", names(measure_data))
names(measure_data) <- gsub("arCoeff()", "AutoregressionCoeff", names(measure_data))
names(measure_data) <- gsub("correlation()", "CorrelationCoeff", names(measure_data))
names(measure_data) <- gsub("maxInds()", "MaxInds", names(measure_data))
names(measure_data) <- gsub("meanFreq()", "MeanFreq", names(measure_data))
names(measure_data) <- gsub("skewness()", "Skewness", names(measure_data))
names(measure_data) <- gsub("kurtosis()", "Kurtosis", names(measure_data))
names(measure_data) <- gsub("bandsEnergy()", "EnergyBand", names(measure_data))
names(measure_data) <- gsub("mag", " Magnitude", names(measure_data))
names(measure_data) <- gsub("tBody", "TimeBody", names(measure_data))
names(measure_data) <- gsub("tGravity", "TimeGravity", names(measure_data))
names(measure_data) <- gsub("fBody", "FrequencyBody", names(measure_data))
names(measure_data) <- gsub("fGravity", "FrequencyGravity", names(measure_data))
names(measure_data) <- gsub("gravity", "Gravity", names(measure_data))
names(measure_data) <- gsub("angle", "Angle", names(measure_data))
names(measure_data) <- gsub("BodyBody", "Body", names(measure_data))

names(measure_data)[1] = "Subject"
names(measure_data)[2] = "Activity"


measures_means <- group_by(measure_data, Subject, Activity)
measures_means <- summarise_all(measures_means, funs(mean))
GnCProject_means <- write.table(measures_means, "GnCProject.txt", row.names = FALSE)


