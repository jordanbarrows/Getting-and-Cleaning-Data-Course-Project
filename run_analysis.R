library(dplyr)

library(reshape2)

## sets the name of the directory to be downloaded
dirname <- "fitnessdata.zip"

## if the file is not there, download it
if (!file.exists(dirname)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, dirname, method = "curl")
}

## if the directory from the unzipped directory is not there, unzip fitnessdata.zip
if (!file.exists("UCI HAR Dataset")) {
    unzip(dirname)
}

## acquire names of features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
activitynames <- read.table("UCI HAR Dataset/activity_labels.txt")
activitynames[,2] <- as.character(activitynames[,2])

## Curate features list with descriptive variable names
featuresmeanstd <- grep("mean..|std..", features[,2])
featureswantedlogical <- grepl("mean..|std..", features[,2])
featureswanted <- features[featuresmeanstd, 2]
featureswanted <- gsub("-", "", featureswanted)
featureswanted <- gsub("Freq..", "Freq", featureswanted)
featureswanted <- gsub("mean..", "Mean", featureswanted)
featureswanted <- gsub("std..", "Std", featureswanted)
featureswanted <- gsub("t", "Timedomain", featureswanted)
featureswanted <- gsub("f", "Frequencydomain", featureswanted)
featureswanted <- gsub("Mag", "Magnitude", featureswanted)
featureswanted <- gsub("Gyro", "Gyroscope", featureswanted)
featureswanted <- gsub("Acc", "Accelerometer", featureswanted)
featureswanted <- gsub("Gravi", "Gravity", featureswanted)

## load train data and make descriptive column names
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainactivities <- read.table("UCI HAR Dataset/train/y_train.txt")
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
traindata <- traindata[,featureswantedlogical]
names(traindata) <- featureswanted
train <- cbind(trainsubjects, trainactivities, traindata)
names(train)[1:2] <- c("Subject", "Activity")


## load test data and make descriptive column names
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testactivities <- read.table("UCI HAR Dataset/test/y_test.txt")
testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
testdata <- testdata[,featureswantedlogical]
names(testdata) <- featureswanted
test <- cbind(testsubjects, testactivities, testdata)
names(test)[1:2] <- c("Subject", "Activity")

## add train and test data sets together and convert Subject and Activity
## columns to factors
combined <- rbind(train, test)
combined$Activity <- factor(combined$Activity, levels = activitynames[,1],
                            labels = activitynames[,2])
combined$Subject <- as.factor(combined$Subject)

## melts combined data by Subject and Activity and then casts as new data table
## with the means for each variable for each combination of Subject/Activity
combined.melted <- melt(combined, id = c("Subject", "Activity"))
combined.mean <- dcast(combined.melted, Subject + Activity ~ variable, mean)

## writes a new file using the final, tidied data set
write.table(combined.mean, "tidydata.txt", row.names = F, quote = F)
