
# Coursera Getting and Cleaning Data Course Project


![Coursera](https://img.shields.io/badge/Coursera-%230056D2.svg?style=for-the-badge&logo=Coursera&logoColor=white) ![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)

This repo contians the scripts required in the course project for the course `Getting and Cleaning Data Course Project` in Coursera.


# Contents

- [Coursera Getting and Cleaning Data Course Project](#coursera-getting-and-cleaning-data-course-project)
- [Contents](#contents)
- [Objective](#objective)
- [Running the project](#running-the-project)
  - [Downloading raw data](#downloading-raw-data)
  - [Running the analysis](#running-the-analysis)


# Objective


1. Download the data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

2. Merges the training and the test sets to create one data set.

3. Extracts only the measurements on the mean and standard deviation for each measurement. 

4. Uses descriptive activity names to name the activities in the data set

5. Appropriately labels the data set with descriptive variable names. 

6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The final output will be shown in a file called `submission_dataset.txt`. A description of the variables contained in the dataset can be seen in the [Codebook](./CodeBook.md).

#  Running the project

## Downloading raw data
```bash
./download_data.sh
```

## Running the analysis

```bash
Rscript run_analysis.R
```

