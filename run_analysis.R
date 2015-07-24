library(reshape2)

## Step 1: Merges the training and the test sets to create one data set.

train_set <- read.table(file.path("train", "X_train.txt"))
test_set <- read.table(file.path("test", "X_test.txt"))

train_activity <- read.table(file.path("train", "y_train.txt"))
test_activity <- read.table(file.path("test", "y_test.txt"))

train_subject <- read.table(file.path("train", "subject_train.txt"))
test_subject <- read.table(file.path("test", "subject_test.txt"))

merged_subject <- rbind(train_subject, test_subject)
merged_activity <- rbind(train_activity, test_activity)
merged_set <- rbind(train_set, test_set)

## Step 2: Extracts only the measurements on the mean and standard deviation.

features <- read.table("features.txt")[, 2]
mean_std_features <- grep("(mean|std)\\(\\)", features)
merged_set <- merged_set[, mean_std_features]
merged_set <- cbind(merged_subject, merged_activity, merged_set)

## Step 3: Uses descriptive names to name the activities in the data set.

activities <- read.table("activity_labels.txt")[, 2]
merged_set[, 2] <- activities[merged_set[, 2]]

## Step 4: Appropriately labels the data set with descriptive variable names.

key_labels <- c("subject", "activity")
variable_labels <- as.character(features[mean_std_features])
names(merged_set) <- c(key_labels, variable_labels)

## Step 5: Creates an independent tidy data set with the average of each
## variable for each activity and each subject.

tidy_set <- melt(merged_set, id = key_labels, measure.vars = variable_labels)
tidy_set <- dcast(tidy_set, subject + activity ~ variable, mean)
write.table(tidy_set, "tidy_data.txt", row.name=FALSE)