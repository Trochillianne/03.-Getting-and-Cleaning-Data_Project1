# Human Activity Recognition Using Smartphones Dataset
The "Getting and Cleaning Data" course project is aimed to collect, work with, and clean a database in order to prepare a tidy dataset that can be used for later analysis.

# Dataset

The data for this project can be downloaded through the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Files

*CodeBook.md.* describes the variables, the data, and any transformations or work that are performed to clean up the data.

*RunAnalysis.R.* contains all the coding for doing the course project in 5 steps:

    * 0. Downloading and Unzipping the data set.
    * 1. Merges the training and the test sets to create one data set.
    * 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    * 3. Uses descriptive activity names to name the activities in the data set
    * 4. Appropriately labels the data set with descriptive variable names.
    * 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*FinalData.txt.* is the resulted final data after going through all the steps described above, resulting in the average features of each subject and each activity. 

Reference:
=========
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
