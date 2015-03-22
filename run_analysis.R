# This is course project by Shuangchun Yan

### Part One: Read In Data
activity_label <- read.table(file="UCI HAR Dataset/activity_labels.txt", sep = " ")
features <- read.table(file="UCI HAR Dataset/features.txt", sep = " ")

# test
X_test <- read.table(file="UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table(file="UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
# train
X_train <- read.table(file="UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table(file="UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
# covert Y_test numbers into activity feature 

# Going through each of the activity 
Y_test$activity <- sapply(Y_test[,1], function(x) {
      activity_label[activity_label[,1] == x,][1,2]
})

Y_train$activity <- sapply(Y_train[,1], function(x) {
      activity_label[activity_label[,1] == x,][1,2]
})

# change the column names
names(Y_test) <- c("activity_label", "activity")
names(Y_train) <- c("activity_label", "activity")

# change the X_test with proper column names
names(X_test) <- features[,2]
names(X_train) <- features[,2]

# change subject_test colunm name
names(subject_test) <- "subject"
names(subject_train) <- "subject"

# combining these data
data_test <- cbind(subject_test, Y_test, X_test)
data_train <- cbind(subject_train, Y_train, X_train)
# combina train and test dataset
data <- rbind(data_test, data_train)

# get the names of all col
names_to_keep <- colnames(data)
# keep only those contain either "mean" or "std"
names_to_keep <- names_to_keep[c(1:3, grep("mean", names_to_keep), grep("std", names_to_keep))]
# remove meanFreq becasue there is no std associated with it, so it is not true "mean" of measurement
names_to_keep <- names_to_keep[-(grep("meanFreq", names_to_keep))]
names_to_keep <- sort(names_to_keep)

# keep only the columns to keep
data_tidy <- data[,names_to_keep]
#move subject to front
data_tidy <- subset(data_tidy, select = c("subject", names_to_keep[names_to_keep != "subject"]))
# order by subject number
data_tidy <- data_tidy[order(data$subject),]

## calculate the mean for each subject and activity

# get all possible subjects and activity for looping
subjects <- unique(data_tidy$subject)
activity <- activity_label[,2]

# create an empty data.frame with set dimension, -1 because I will get ride of activity_label col
data_final <- data.frame(matrix(NA, nrow = 0, ncol = (length(colnames(data_tidy))-1)))

# loop through each subject
for(i in subjects) { 
      subject_data <- data_tidy[data_tidy$subject == i,]
      # for each subject, loop through each activity to get means
      for (j in activity) {
            subject_activity <- subject_data[subject_data$activity == j,]
            avg_subject_activity <- colMeans(subject_activity[4:length(names_to_keep)])
            data_final <- rbind(data_final, data.frame(t(c(i, j, avg_subject_activity))))
      }
}

# the other column names were given by colMeans, so add the labels to the first two col
names(data_final) <- c("subject", "activity", names_to_keep[4:length(names_to_keep)])
head(data_final)
dim(data_final)
write.table(data_final, file = "data_final.txt", row.name=FALSE)
