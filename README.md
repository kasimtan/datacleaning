# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.

The goal is to prepare tidy data that can be used for later analysis.

## Files

#### `run_analysis.R`

R script that does following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### `tidy_data.txt`

The result of tidy data set described above.

#### `CodeBook.md`

Description of the variables and the data in the tidy data set.

## How to Run

1. Download and extract/un-zip the data for the project:
  * [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Download `run_analysis.R` file and put under the project data folder.
3. Launch RStudio and set working directory to the project data folder.
4. In RStudio, run `source("run_analysis.R")` to execute the script.
5. The result `tidy_data.txt` will be generated under the project data folder.
