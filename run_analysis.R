library(dplyr)
#download and unzip the raw data file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "smartphone_data.zip", method = "curl")
unzip("smartphone_data.zip")
#read subject,features,activities, x and Y data (both train and test) to R
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
#make sure all columns of test and train data are same for x
x_test_col <- list(colnames(x_test))
x_train_col <- list(colnames(x_train))
setdiff(x_test_col,x_train_col)
#merge train and test data for x 
X <- rbind(x_train, x_test)
# Repeat the same for y and subject datasets
y_test_col <- list(colnames(y_test))
y_train_col <- list(colnames(y_train))
setdiff(y_test_col,y_train_col)
Y <- rbind(y_train, y_test)
colnames(subject_test)
colnames(subject_train)
subject <- rbind(subject_train,subject_test)
#create a single dataset by merging all columns of subject, x and y
Merged_data <- cbind(subject,X, Y)
#Extracts the mean and standard deviation for each measurement.
Tidy_data <- Merged_data %>% select (subject, code, contains("mean"), contains("std"))
#Modify the column names of the dataset to give better meanings
colnames(Tidy_data)[2] = "Activity"
colnames(Tidy_data)<-gsub("^t", "Time", colnames(Tidy_data))
colnames(Tidy_data)<-gsub("^f", "Frequency", colnames(Tidy_data))
colnames(Tidy_data)<-gsub(".std", " STD", colnames(Tidy_data))
colnames(Tidy_data)<-gsub("angle", "Angle", colnames(Tidy_data))
colnames(Tidy_data) <- gsub("BodyBody","Body", colnames(Tidy_data))
colnames(Tidy_data)<-gsub("Acc", " Accelerometer", colnames(Tidy_data))
colnames(Tidy_data)<-gsub("Mag", " Magnitude", colnames(Tidy_data))
colnames(Tidy_data)<-gsub("Gyro", " Gyroscope ", colnames(Tidy_data))
colnames(Tidy_data)<-gsub(".tBody", " Timebody ", colnames(Tidy_data))
#Replace the codes in the activity column with actual activities.
Tidy_data$Activity <- activities[Tidy_data$Activity, 2]
#Create the final tidy dataset with average of variables for each activity and each subject
Second_Tidy_data <- Tidy_data %>%
group_by(subject, Activity) %>%
summarise_all(funs(mean))
write.table(Second_Tidy_data, "Second_Tidy_data.txt", row.name = FALSE)





