This is the code book for the data set "tidy_dataset_avg.txt" made using the "run_analysis.R" 
script.

The data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The resulting data frame has the following dimension:
180 rows: observations
88 columns: variables 

There are 6 observations per subject. 

Column 1 "Activity": Type of activity performed by the subjects. Factor with 6 levels: 
LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

Column 2 "Subject": Subject who performed the activity: numeric variable

Columns 3 to 88: Mean and Std measurements taken using the accelerometer and gyroscope 3-axial when 
the subject moved: Numeric variables 