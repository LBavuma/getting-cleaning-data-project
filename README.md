Getting and Cleaning Data Course Project
This repository contains the solution for the Getting and Cleaning Data course project, which demonstrates the ability to collect, work with, and clean a dataset.
Project Overview
The purpose of this project is to prepare tidy data from the Human Activity Recognition Using Smartphones dataset that can be used for later analysis. The data represents measurements collected from accelerometers from Samsung Galaxy S smartphones worn by 30 volunteers performing six different activities.
Files in this Repository

run_analysis.R - Main R script that performs all data cleaning and analysis steps
tidy_data.txt - The final tidy dataset (output of the analysis)
CodeBook.md - Code book describing variables, data, and transformations
README.md - This file explaining the analysis and how scripts work

How the Script Works
The run_analysis.R script performs the following steps:
Step 1: Download and Load Data

Downloads the dataset if not already present
Extracts the ZIP file
Reads training and test datasets along with feature names and activity labels

Step 2: Merge Training and Test Sets

Combines X_train and X_test (feature measurements)
Combines y_train and y_test (activity labels)
Combines subject_train and subject_test (subject identifiers)
Applies proper column names from the features file

Step 3: Extract Mean and Standard Deviation Measurements

Identifies columns containing mean() or std() measurements using regex pattern
Extracts only these relevant columns (66 total measurements)

Step 4: Apply Descriptive Activity Names

Replaces numeric activity codes (1-6) with descriptive names:

1: WALKING
2: WALKING_UPSTAIRS
3: WALKING_DOWNSTAIRS
4: SITTING
5: STANDING
6: LAYING



Step 5: Create Descriptive Variable Names

Transforms abbreviated variable names to be more readable:

t prefix → Time
f prefix → Frequency
Acc → Accelerometer
Gyro → Gyroscope
Mag → Magnitude
-mean() → Mean
-std() → StandardDeviation
Removes hyphens and fixes duplicate "Body" terms



Step 6: Create Tidy Dataset with Averages

Groups data by subject and activity
Calculates the mean of each measurement variable for each subject-activity combination
Results in 180 observations (30 subjects × 6 activities)
Writes the final tidy dataset to tidy_data.txt

Running the Analysis

Clone this repository or download the files
Ensure you have R installed with the dplyr package
Set your working directory to the location containing run_analysis.R
Run the script:
rsource("run_analysis.R")

The script will automatically download the data if needed and create tidy_data.txt

Dependencies

R (version 3.0 or higher recommended)
dplyr package

Dataset Information
The original dataset comes from experiments with 30 volunteers (age 19-48) performing six activities while wearing a Samsung Galaxy S II smartphone. The smartphone's embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at 50Hz.
Original Dataset Source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data for Project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Output
The final tidy dataset (tidy_data.txt) contains:

180 rows (30 subjects × 6 activities)
68 columns (subject, activity, and 66 averaged measurements)
Each row represents the average of each measurement variable for a specific subject performing a specific activity
