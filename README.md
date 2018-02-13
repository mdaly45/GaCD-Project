# GaCD-Course Project

### Purpose
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

### Data Set
The "Human Activity Recognition Using Smartphones Data Set" from the University of California, Irvine, Machine Learning 
Repository is used for this analysis. An in depth description of the data set can be 
found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set can be obtained using this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Cleaning the Data Set
The data set was cleaned and made into tidy data using the "run_analysis.R" script. The script operates as follows:

1. The script checks to see if the data set has been downloaded and included in the appropriate directory. If not, then
the data set is downloaded, and unzipped. 
2. The data is seperated into several text files; each text file is read into R.
3. Next, the data sets are combined. Specific columns for "activityId" and "subjectId" are renamed to aid in the data 
set merging process. See "Codebook.md" for further details.
4. The data set is then subsetted to only include measurements of standard deviation and mean. 
5. Descriptive activity names are then used to name the specific activities in the data set.
6. Appropriate labels were applied to the data set so they would have more descriptive variable names.
7. Lastly, a second independent tidy data set with the average of each variable for each activity and each subject was 
created.

A sample of the output of running the run_analysis.R script is provided as a text file titled "tidydata2.txt", which
was created by running the "run_analysis.R" script on R (version 3.4.3 (2017-11-30)) on a Windows 10 64-bit computer.

"CodeBook.md" is a code book that has been updated to indicate all the variables and summaries calculated, 
along with units, and any other relevant information.
