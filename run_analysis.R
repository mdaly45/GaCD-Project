#library(dplyr) 
#library(plyr)
#
#if(!file.exists("./data")){
#      dir.create("./data")
#      }
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile="./data/UCI_HAR_Dataset.zip")
# 
# # Unzip dataSet to /data directory
# unzip(zipfile="./data/UCI_HAR_Dataset.zip",exdir="./data")

#STEP 1: Merge the training and the test sets to create one data set.
#Read in Datasets
x_tr <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
x_te <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_tr <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
y_te <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
sub_tr <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
sub_te <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
feat <- read.table('./data/UCI HAR Dataset/features.txt')
actL = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#reassign Column Names
colnames(x_tr) <- feat[,2]
colnames(x_te) <- feat[,2]
y_tr <-rename(y_tr, activityId = V1)
y_te <-rename(y_te, activityId = V1)
sub_tr <-rename(sub_tr, subjectId = V1)
sub_te <-rename(sub_te, subjectId = V1)
actL <- rename(actL, activityId = V1, activityType = V2)

#Combine the Data into one data.frame
data <- rbind(cbind(y_te, sub_te, x_te), cbind(y_tr, sub_tr, x_tr))

#STEP 2: Extracting only the measurements on the mean and standard deviation for each measurement
col_names <- colnames(data)
filt <- c("mean..", "std..", "activityId", "subjectId")
sub_data<- data[, (grepl(paste(filt,collapse="|"), col_names)) == TRUE]

#STEP 3: Use descriptive activity names to name the activities in the data set
named_data <- arrange(join(sub_data, actL, by = "activityId"), activityId)

#STEP 4: Creating a second, independent tidy data set with the average of each variable for each
#activity and each subject
tidydata2 <- aggregate(.~subjectId + activityId, named_data, mean)
tidydata2 <- arrange(tidydata2, subjectId, activityId)
write.table(tidydata2, "tidydata2.txt", row.name=FALSE)

#Optional: Check to see if data is tidy
test <- read.table("tidydata2.txt", header = TRUE)