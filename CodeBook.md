# Code book for Getting and Cleaning Data Course Project

The following actions were done to create the “data_final.txt” tidy data set. 

1. Training and testing data sets were merged into one.
2. Inertial signals were not included.
3. Training labels (activity labels) (1-6) were converted to text, descriptive of the kind of activities.
4. Subject were sorted from 1-30.
5. Only measurements with both "mean" and "std" were chosen to be kept. Other data with "mean" such as "meanFreq" were removed, as they are not true means and there is no standard deviations associated with them.
6. Variable names were taken from "features.txt"
7. For tidy data set, as requested by step 5, average value was calculated from raw data for each subject and each activity.

## Descriptions of the variables

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

"mean()" and "std()" were added to the above to indicate the data were either mean or standard deviation, to get something like the following:

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X

The tidy dataset has these data from column 3 to 68, _sorted alphabetically_. 

__Note__ that the tidy dataset contains the mean of each variables for each activity and each subject only, which were calculated from raw data. 