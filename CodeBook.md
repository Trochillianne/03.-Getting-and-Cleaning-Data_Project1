a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

## Variables 

		- 'Features': The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
		- 'Activities': List of activities performed when the corresponding measurements were taken and its codes (labels)

		- 'subjectTest': contains test data of 9/30 volunteer test subjects being observed
		- 'subjectTrain': contains train data of 21/30 volunteer subjects being observed

		- 'x_test': contains recorded features test data
		- 'y_test': contains test data of activities code labels

		- 'x_train': contains recorded features train data
		- 'y_train': contains train data of activities code labels

## Transformation

**Step 1**  

    - 'x' is created by merging x_train and x_test using rbind() function
		
    - 'y' is created by merging y_train and y_test using rbind() function
		
    - 'subject' is created by merging subject_train and subject_test using rbind() function
		
    - 'mergedData' is created by merging Subject, Y and X using cbind() function
    
**Step 2**  
*Data.* is created by subsetting *MergedData.*, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

**Step 3** 
Entire numbers in code column of the *Data.* replaced with corresponding activity names taken from second column of the activities variable

**Step 4** 
Appropriately labels the data set with descriptive variable names
code column in *Data.* renamed into activities

    * All *Acc.* in column’s name replaced by Accelerometer
    * All *Gyro.* in column’s name replaced by Gyroscope
    * All *BodyBody.* in column’s name replaced by Body
    * All *Mag.* in column’s name replaced by Magnitude
    * All start with character *f.* in column’s name replaced by Frequency
    * All start with character *t.* in column’s name replaced by Time

**Step 5** 
*FinalData.* is created by sumarizing *Data.* taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export *FinalData.* into FinalData.txt file.


The "run_analysis.R." script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

1. Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

Assign each data to variables




Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable
