# COURSERA_GETTING AND CLEANING DATA COURSE PROJECT

# Loading the package for data manipulation
library(dplyr)

# Downloading and extracting the data set
filename <- "Coursera_final_project_C3.zip"
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL, destfile = "Coursera_final_project_C3.zip")
unzip("Coursera_final_project_C3.zip")

# Assigning all data frames and setting the names to the variables
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("Number", "Functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Code")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Code")

## The above read the data from the files into variables, use str() to look at its properties. 


# STEP 1: MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET.
# Combine subjects, activity and features into test and train sets; merged it into a full data set. 
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
mergedData <- cbind(subject, y, x)

## rbind combines data frames by rows and cbind by columns. 

# STEP 2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STD. DEVIATION FOR EACH MEASUREMENT.
Data <- mergedData %>% select(Subject, Code, contains("mean"), contains("std"))


# STEP 3. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
Data$code <- activities[tidyData$code, 2]

# STEP 4: APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES.
names(Data)[2] = "Activity"
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
names(Data)<-gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("angle", "Angle", names(Data))
names(Data)<-gsub("gravity", "Gravity", names(Data))

## Use View(tidyData) to overview the data set


# STEP 5: FROM THE DATA SET IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH 
# THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.

finalData <- Data %>%
        group_by(Subject, Activity) %>%
        summarise_all(funs(mean))
write.table(finalData, "FinalData.txt", row.name=FALSE)

#Checking variable names and take a look at final data

str(finalData)
finalData