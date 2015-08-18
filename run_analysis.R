## 18.08.2015 12:35

# Download and unzip files into working directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "running.zip")
unzip("running.zip")


# install.packages("dplyr")

library(dplyr)

# Load train and test data and merge into one data.frame
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
all.data <- full_join(train.data, test.data)
rm(train.data)
rm(test.data)


# Load Activity labels for train and test set and replace them with
# its activity names, and join them together.
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
train.labels <- unlist(read.table("UCI HAR Dataset/train/y_train.txt"))
test.labels <- unlist(read.table("UCI HAR Dataset/test/y_test.txt"))
all.labels <- data.frame(Activity = activity.labels[c(train.labels, test.labels)])
rm(train.labels)
rm(test.labels)

# Join the ids of train and test subjects
train.subject <- unlist(read.table("UCI HAR Dataset/train/subject_train.txt"))
test.subject <- unlist(read.table("UCI HAR Dataset/test/subject_test.txt"))
all.subject <- data.frame(Subject=c(train.subject, test.subject))
rm(train.subject)
rm(test.subject)

# Rename columns by features 
header.names <- read.table("UCI HAR Dataset/features.txt")[,2]
names(all.data) <- header.names

# Find and select the variable names with "mean" or "std" in it and add columns "Subject" (ID)
# and "Activity" (label)
indices <- grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", header.names)
named.data <- arrange( data.frame(all.subject, all.labels, all.data[,indices] ), Subject, Activity)
rm(all.data)
rm(all.labels)
rm(all.subject)
selected.names <- names(named.data)
selected.names <- gsub( "\\(\\)|\\.\\.","", gsub("std","Std",gsub("mean","Mean",selected.names)))
names(named.data) <- selected.names

# Take the mean of every column for every pair of activity and subject
n<-length(names(named.data))
tidy.data <-aggregate(named.data[,3:n], by = named.data[c("Activity","Subject")], FUN=mean, na.rm=T)
rm(activity.labels)
rm(header.names)
rm(indices)
rm(n)
rm(selected.names)

write.table(tidy.data, "tidy_mean_activity_data.txt", row.names = FALSE)

# rm(named.data)
# rm(tidy.data)
