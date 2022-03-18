# renv::snapshot()

library(dplyr)

# Read feature names to use then when reading X_train and X_test
features <- read.table("~/dev/rprojects/CleanningCourseProject/UCI HAR Dataset/features.txt", quote="\"", comment.char="", col.names = c('n', 'names'))


# Function that reads train and test data and merges them to provide the complete dataset
get_data = function(){
  # Reat train data
  train_data <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="", col.names = features$names)
  train_data$subject = read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")$V1
  train_data$activity_type_id = read.table("UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")$V1

    
  # Read test data
  test_data <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="", col.names = features$names)
  test_data$subject = read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")$V1
  test_data$activity_type_id = read.table("UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")$V1
  
  # Merge and return
  rbind(train_data, test_data)
  
}

# Load data in r
data = get_data()


# Find out which variables contain mean and standard deviation
mean_std_features = features %>%
  filter(grepl('mean\\(\\)', names) | grepl('std\\(\\)', names)) %>%
  .$n


# Filter variables contain mean and standard deviation with subject and activity type
data = data %>%
  select(mean_std_features, subject, activity_type_id)


# Add activity type name through activity type id
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="", col.names = c('activity_type_id', 'activity_type'))
data= merge(data, activity_labels, by='activity_type_id', all.x = TRUE, sort = FALSE) #LEFT join


# Filter right columns and generate the final submission dataset
submission_dataset = data %>%
  select(-activity_type_id) %>%
  group_by(activity_type, subject) %>%
  summarise_all(mean)

# Write the submission to a csv file
write.table(submission_dataset, 'submission_dataset.txt', row.name=FALSE)

