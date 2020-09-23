Codebook for run_analysis.R

***download data*** 
download zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracts to file named “UCI Har Dataset”.


***Organizing and structuring the data***
***Into Variables***

•	activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
“activities” is a 2 col, 6 row dataset listing the six activities performed by subjects

•	features <- read.table("UCI HAR Dataset/features.txt", col.names = c("number","feature"))
“features” is a 2 col,  561 row dataset with time and frequency domain variables gathered from the accelerometers and gyroscopes worn by each participant

•	test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
“test_subject” is a 1 col, 2947 row dataset with the test data for 9 out of the 30 subjects

•	x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
“x_test” is a 1 col, 2947 row dataset with the data for the features for 9 out of the 30 subjects

•	y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
“y_test” is a 1 col, 2947 row dataset linking the x_test data to the activities performed

•	train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
“train_subject” is a 1 col, 7352 row dataset with the train data for 21 out of the 30 subjects

•	x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
“x_train” is a 1 col, 7352 row dataset with the data for the features for 21 out of the 30 subjects

•	y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
“y_train” is a 1 col, 7352 row dataset linking the x_train data to the activities performed


***Into a Dataframe***

•	subject <- rbind(test_subject, train_subject)
Binds the test and the train subject columns for a complete dataset consisting of 1 col, 10299 rows

•	x_set <- rbind(x_test, x_train)
Combines the test and train subject data on the features for a complete dataset of 1 col, 10299 rows

•	y_set <- rbind(y_test, y_train)
Combines the test and train subject data on the activities performed during the gathering of the features data for a complete dataset of 1 col, 10299 rows

•	smartlab_data <- cbind(subject, x_set, y_set)
Combines the subject, features and activity data, making x_set and y_set into columns connecting the data for subject, feature and activity performed, 563 cols, 10299 rows


***Selecting Required Data***

•	measure_data <- select(smartlab_data, subject, code, grep("mean|std", colnames(smartlab_data), value = TRUE))
Selecting on the columns of data that have “mean” or “std” in the name.

•	measure_data$code <- activities[measure_data$code, 2]
Labeling the data in the column “code” by replacing it with the activity with the same code from the second column in the “activities” variable


***Renaming variables***

Using gsub I renamed the variable names to be more descriptive. Lines 33-58

•	names(measure_data)[1] = "Subject" 
•	names(measure_data)[2] = "Activity"
Replaces the first column name with “Subject” and the second column name with “Activity”


***Creating New Dataset with the means for each variable for each activity and each subject***

•	measures_means <- group_by(measure_data, Subject, Activity)
Grouping data by Subject and Activity

•	measures_means <- summarise_all(measures_means, funs(mean))
Taking the mean for each group

•	GnCProject_means <- write.table(measures_means, "GnCProject.txt", row.names = FALSE)
Writes data into a table in a separate file by the name of “GnCProject.txt”




