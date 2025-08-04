# Getting and Cleaning Data Course Project
# run_analysis.R
# 
# This script performs the following steps:
# 1. Merges the training and test sets to create one data set
# 2. Extracts only measurements on mean and standard deviation
# 3. Uses descriptive activity names
# 4. Labels the data set with descriptive variable names
# 5. Creates a tidy data set with averages for each activity and subject

library(dplyr)

# Check if data directory exists, if not download and extract
if (!file.exists("UCI HAR Dataset")) {
  if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  "getdata_projectfiles_UCI HAR Dataset.zip")
  }
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}

# Read feature names and activity labels
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
colnames(activity_labels) <- c("activity_id", "activity_name")

# Read training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Step 1: Merge training and test sets
X_combined <- rbind(X_train, X_test)
y_combined <- rbind(y_train, y_test)
subject_combined <- rbind(subject_train, subject_test)

# Add column names to the combined data
colnames(X_combined) <- features[, 2]
colnames(y_combined) <- "activity_id"
colnames(subject_combined) <- "subject"

# Step 2: Extract only mean and standard deviation measurements
# Find columns with mean() or std() in their names
mean_std_cols <- grep("-(mean|std)\\(\\)", features[, 2])
X_mean_std <- X_combined[, mean_std_cols]

# Step 3: Use descriptive activity names
# Merge activity labels with activity IDs
y_labeled <- merge(y_combined, activity_labels, by = "activity_id", sort = FALSE)

# Step 4: Label the data set with descriptive variable names
# Clean up variable names
colnames(X_mean_std) <- gsub("^t", "Time", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("^f", "Frequency", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("Acc", "Accelerometer", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("Gyro", "Gyroscope", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("Mag", "Magnitude", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("BodyBody", "Body", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("-mean\\(\\)", "Mean", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("-std\\(\\)", "StandardDeviation", colnames(X_mean_std))
colnames(X_mean_std) <- gsub("-", "", colnames(X_mean_std))

# Combine all data into one dataset
complete_data <- cbind(subject_combined, y_labeled$activity_name, X_mean_std)
colnames(complete_data)[2] <- "activity"

# Step 5: Create tidy data set with averages for each activity and subject
tidy_data <- complete_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean) %>%
  arrange(subject, activity)

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Print summary information
cat("Tidy data set created successfully!\n")
cat("Dimensions:", dim(tidy_data)[1], "rows x", dim(tidy_data)[2], "columns\n")
cat("Variables:", colnames(tidy_data)[1:10], "...\n")
cat("File saved as: tidy_data.txt\n")
