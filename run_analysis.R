library(plyr)
library(dplyr)
## source the data loading file if it hasn't been sourced already
if(!exists("downloadDataFile", mode="function")) {
    source("download_data.R")
}

## Read data
path <- downloadActivityDataSet()

## Extract variable names from features.txt
features <- read.csv(file.path(path, "features.txt"), sep = "",
                     header = FALSE, stringsAsFactors = FALSE,
                     col.names = c("index", "variable"))
col_names <- gsub("\\-", "_", features$variable)  ## Replace - with _. Plays nicer for col names
col_names <- gsub("\\(\\)", "", col_names) ## Remove () as they don't play nice with col names

## Read training data
training <- read.csv(file.path(path, "train", "X_train.txt"), sep = "", header = FALSE,
                     colClasses = "numeric", col.names = col_names)
## add activity, subject and dataset info
training$activity <- as.factor(readLines(file.path(path, "train", "Y_train.txt")))
training$subject <- as.factor(readLines(file.path(path, "train", "subject_train.txt")))
training$dataset <- as.factor("train")

## Read test data
testing <- read.csv(file.path(path, "test", "X_test.txt"), sep = "", header = FALSE,
                    colClasses = "numeric", col.names = col_names)
## add activity, subject and dataset info
testing$activity <- as.factor(readLines(file.path(path, "test", "Y_test.txt")))
testing$subject <- as.factor(readLines(file.path(path, "test", "subject_test.txt")))
testing$dataset <- as.factor("test")

## read the activity labels from activity_labels.txt
activity_labels <- read.csv(file.path(path, "activity_labels.txt"), sep = "",
                            header = FALSE, stringsAsFactors = FALSE,
                            col.names = c("id", "activity"))

## 1. Merge the data sets
tidy_data <- merge(training, testing, all=TRUE)

## 2. Extracts only the measurements on the mean and standard deviation
## for each measurement.
tidy_data <- select(tidy_data, activity, subject, dataset, matches("\\_(mean|std)(\\_.*)?$"))

## 3. Uses descriptive activity names to name the activities in the data set
tidy_data$activity <- mapvalues(tidy_data$activity, from = activity_labels$id, to = activity_labels$activity)

## 4. Appropriately labels the data set with descriptive variable names.
## Loaded the table with col names already set from features.txt

path <- file.path(".", "output")
if (!dir.exists(path)) {
    dir.create(path)
}
write.csv(tidy_data, file = file.path("output", "tidy_data.txt"), row.names = FALSE)
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.


summary_data <- tidy_data %>% group_by(activity, subject) %>% select(-dataset) %>% summarise_each(funs(mean))
write.csv(summary_data, file = file.path("output", "summary_data.txt"), row.names = FALSE)

