## CodeBook

The following is a codebook of the R script "run_analysis.R", and the output text file "tidydata2.txt"

run_analysis.R requires the use of the dplyr package. 

### Getting the Data

data for this analysis can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Cleaning the Data using run_analysis.R

1. After acquiring the data from the link above, the data is read into R using the read.table function. each data set was read in
individually; the following txt files were read:
- x_train.txt
- x_test.txt
- y_train.txt
- y_test.txt
- subject_train.txt
- subject_test.txt
- features.txt
- activity_labels.txt

2. The columns for each dataset were renamed using the colnames function, and the rename function. This is to help assist in 
combining the datasets into one dataset. 

3. The datasets are combined using the cbind function to combine the test data into one dataset, and the train data into another 
dataset; these two combined data sets are then combined using the rbind function.

4. The mean and standard deviation values in the dataset were then extracted, using the column names passed through a filter that
only retains columns that contain the terms "std.", "mean.", activityId, or subjectId"; this is accomplished with the grepl function. 

5. The data set and actibvity labels data.frame are then joined together using the inner_join function, and joining them by activityId.

6. The column names of the data set are cleaned up to make them more readable using the gsub function. for example, "Acc" was replaced
with "Accelerometer".

7. the dataset "tidydata2" is created by calculating the mean of each variable grouped by subjectId and activityId. 

8. Lastly, The final dataset is then written to the "tidydata2.txt" document using the write.table function. 

### "tidydata2.txt"; Output of run_analysis.R

activityId - activityType - The number of the activity that was recorded; the numbering is as follows:
1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying
 
subjectId - ID number assigned to the subject in the study.

The following parameters were measured and calculated:
- tBodyAccelerometer-mean()-X 
- tBodyAccelerometer-mean()-Y 
- tBodyAccelerometer-mean()-Z 
- tBodyAccelerometer-std()-X 
- tBodyAccelerometer-std()-Y 
- tBodyAccelerometer-std()-Z 
- tGravityAccelerometer-mean()-X
- tGravityAccelerometer-mean()-Y
- tGravityAccelerometer-mean()-Z
- tGravityAccelerometer-std()-X
- tGravityAccelerometer-std()-Y
- tGravityAccelerometer-std()-Z
- tBodyAccelerometerJerk-mean()-X
- tBodyAccelerometerJerk-mean()-Y
- tBodyAccelerometerJerk-mean()-Z
- tBodyAccelerometerJerk-std()-X
- tBodyAccelerometerJerk-std()-Y
- tBodyAccelerometerJerk-std()-Z
- tBodyGyroscope-mean()-X
- tBodyGyroscope-mean()-Y
- tBodyGyroscope-mean()-Z
- tBodyGyroscope-std()-X
- tBodyGyroscope-std()-Y
- tBodyGyroscope-std()-Z
- tBodyGyroscopeJerk-mean()-X
- tBodyGyroscopeJerk-mean()-Y
- tBodyGyroscopeJerk-mean()-Z
- tBodyGyroscopeJerk-std()-X
- tBodyGyroscopeJerk-std()-Y
- tBodyGyroscopeJerk-std()-Z
- tBodyAccelerometerMagnitude-mean()
- tBodyAccelerometerMagnitude-std()
- tGravityAccelerometerMagnitude-mean()
- tGravityAccelerometerMagnitude-std()
- tBodyAccelerometerJerkMagnitude-mean()
- tBodyAccelerometerJerkMagnitude-std()
- tBodyGyroscopeMagnitude-mean()
- tBodyGyroscopeMagnitude-std()
- tBodyGyroscopeJerkMagnitude-mean()
- tBodyGyroscopeJerkMagnitude-std()
- fBodyAccelerometer-mean()-X
- fBodyAccelerometer-mean()-Y
- fBodyAccelerometer-mean()-Z
- fBodyAccelerometer-std()-X
- fBodyAccelerometer-std()-Y
- fBodyAccelerometer-std()-Z
- fBodyAccelerometer-meanFreq()-X
- fBodyAccelerometer-meanFreq()-Y
- fBodyAccelerometer-meanFreq()-Z
- fBodyAccelerometerJerk-mean()-X
- fBodyAccelerometerJerk-mean()-Y
- fBodyAccelerometerJerk-mean()-Z
- fBodyAccelerometerJerk-std()-X
- fBodyAccelerometerJerk-std()-Y
- fBodyAccelerometerJerk-std()-Z
- fBodyAccelerometerJerk-meanFreq()-X
- fBodyAccelerometerJerk-meanFreq()-Y
- fBodyAccelerometerJerk-meanFreq()-Z
- fBodyGyroscope-mean()-X
- fBodyGyroscope-mean()-Y
- fBodyGyroscope-mean()-Z
- fBodyGyroscope-std()-X
- fBodyGyroscope-std()-Y
- fBodyGyroscope-std()-Z
- fBodyGyroscope-meanFreq()-X
- fBodyGyroscope-meanFreq()-Y
- fBodyGyroscope-meanFreq()-Z
- fBodyAccelerometerMagnitude-mean()
- fBodyAccelerometerMagnitude-std()
- fBodyAccelerometerMagnitude-meanFreq()
- fBodyBodyAccelerometerJerkMagnitude-mean()
- fBodyBodyAccelerometerJerkMagnitude-std()
- fBodyBodyAccelerometerJerkMagnitude-meanFreq()
- fBodyBodyGyroscopeMagnitude-mean()
- fBodyBodyGyroscopeMagnitude-std()
- fBodyBodyGyroscopeMagnitude-meanFreq()
- fBodyBodyGyroscopeJerkMagnitude-mean()
- fBodyBodyGyroscopeJerkMagnitude-std()
- fBodyBodyGyroscopeJerkMagnitude-meanFreq()
