The README file explains the files within the repositiory. The data is found in the "UCI HAR Dataset" folder. This is the course project for the JOhn Hopkin's Getting and Cleaning data course on Coursera.

1.	codebook.md- Describes the variables in GnCProject.txt and explains the transformations accomplished by the run_analysis.R script on the original data. 
2.	run_analysis.R – Gets the data and applies a series of transformations show below:
    - Merges the ***training*** and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names.
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
3.	GnCProject.txt - A tidy dataset created from the original dataset by performing the transformations in run_analysis.R.
