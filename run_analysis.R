#You should create one R script called run_analysis.R that does the following.

setwd("C:/Users/Jeannette/Dropbox/Coursera/R/UCI HAR Dataset/")
library(dplyr)
library(tidyr)

#4. Appropriately labels the data set with descriptive variable names.
header<-readLines("features.txt")

#create test table
#read activity table
activitytest<-read.table("y_test.txt", col.names = "Activity")
#read subject table
subjecttest<-read.table("subject_test.txt", col.names = "Subject")
#read test table
test<-read.table("X_test.txt", col.names = header)
#combine test table, subject table, and activity table
test<-cbind(subjecttest, activitytest, test)

#create train table
#read activity table
activitytrain<-read.table("y_train.txt", col.names = "Activity")
#read subject table
subjecttrain<-read.table("subject_train.txt", col.names = "Subject")
#read train table
train<-read.table("X_train.txt", col.names = header)
#combine train table, subject table, and activity table
train<-cbind(subjecttrain, activitytrain, train)

#1. Merges the training and the test sets to create one data set.
combined<-rbind(train,test)
activity<-combined$Activity
subject<-combined$Subject

#2. Extracts only the measurements on the mean and standard deviation for each 
#measurement.
combined<-select(combined, contains("mean"), contains("std"), 
                  contains("Activity"), contains("Subject"))

#3. Uses descriptive activity names to name the activities in the data set
combined$Activity <- factor(combined$Activity,
                    levels = c(1,2,3,4,5,6),
                    labels = c("WALKING", 
                               "WALKING_UPSTAIRS", 
                               "WALKING_DOWNSTAIRS",
                               "SITTING",
                               "STANDING",
                               "LAYING"))

#5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
tidydataset<-aggregate(x = combined, by = list(combined$Activity, combined$Subject), 
                       FUN = "mean")
#remove columns that are not necessary anymore
tidydataset$Subject<-NULL
tidydataset$Activity<-NULL
#give appropriate column names to new columns
colnames(tidydataset)[1:2]<-c("Activity", "Subject")
