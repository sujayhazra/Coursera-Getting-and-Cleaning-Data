#Getting and Cleaning Data: Course Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This has the R script, run_analysis.R, which does the following:

    1. Add the package reshape2, remember to install this package before running this R script
    2. Set the working directory, download the file and unzip the file
    3. Load activity labels and features
    4. Extract the features data related to Mean and Standard Deviation, standardize the values to Mean and Std and removing '-', brackets etc
    5. Load both the training and test datasets
    6. Load the activity and subject data for each dataset, and merges those columns with the dataset
    7. Merges the two datasets
    8. Turn activities & subject columns into factors
    9. Create a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file tidy.txt.