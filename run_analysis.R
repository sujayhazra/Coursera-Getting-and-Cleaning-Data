#adding package reshape2, remember to install this package before running this R script
library(reshape2)

#setting the working directory
setwd("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project")

#Download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/getdata_dataset.zip")

#check the files in folder
#dir()
#"getdata_dataset.zip" "run_analysis.R"  

#unzip destination file
unzip("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/getdata_dataset.zip")
#dir()
#"getdata_dataset.zip" "run_analysis.R"      "UCI HAR Dataset"

# load activity labels and features
activityLabels <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

#activityLabels
#  V1                 V2
#1  1            WALKING
#2  2   WALKING_UPSTAIRS
#3  3 WALKING_DOWNSTAIRS
#4  4            SITTING
#5  5           STANDING
#6  6             LAYING

features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

#head(features)
#  V1                V2
#1  1 tBodyAcc-mean()-X
#2  2 tBodyAcc-mean()-Y
#3  3 tBodyAcc-mean()-Z
#4  4  tBodyAcc-std()-X
#5  5  tBodyAcc-std()-Y
#6  6  tBodyAcc-std()-Z

# Extract the features data related to Mean and Standard Deviation
# Also standardize the values to Mean and Std and removing '-', brackets etc
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)
# head(featuresWanted.names)
#[1] "tBodyAccMeanX" "tBodyAccMeanY" "tBodyAccMeanZ" "tBodyAccStdX"  "tBodyAccStdY" 
#[6] "tBodyAccStdZ" 

#Load the train data set
train <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/train/X_train.txt")[featuresWanted]
# head(train)
#        V1          V2         V3         V4         V5         V6       V41
#1 0.2885845 -0.02029417 -0.1329051 -0.9952786 -0.9831106 -0.9135264 0.9633961
#2 0.2784188 -0.01641057 -0.1235202 -0.9982453 -0.9753002 -0.9603220 0.9665611
#3 0.2796531 -0.01946716 -0.1134617 -0.9953796 -0.9671870 -0.9789440 0.9668781
#4 0.2791739 -0.02620065 -0.1232826 -0.9960915 -0.9834027 -0.9906751 0.9676152
#5 0.2766288 -0.01656965 -0.1153619 -0.9981386 -0.9808173 -0.9904816 0.9682244
#6 0.2771988 -0.01009785 -0.1051373 -0.9973350 -0.9904868 -0.9954200 0.9679482 ...more cols
trainActivities <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/train/Y_train.txt")
# head(trainActivities)
#  V1
#1  5
#2  5
#3  5
#4  5
#5  5
#6  5
trainSubjects <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)
# head(train)
#  V1 V1        V1          V2         V3         V4         V5         V6       V41
#1  1  5 0.2885845 -0.02029417 -0.1329051 -0.9952786 -0.9831106 -0.9135264 0.9633961
#2  1  5 0.2784188 -0.01641057 -0.1235202 -0.9982453 -0.9753002 -0.9603220 0.9665611
#3  1  5 0.2796531 -0.01946716 -0.1134617 -0.9953796 -0.9671870 -0.9789440 0.9668781
#4  1  5 0.2791739 -0.02620065 -0.1232826 -0.9960915 -0.9834027 -0.9906751 0.9676152
#5  1  5 0.2766288 -0.01656965 -0.1153619 -0.9981386 -0.9808173 -0.9904816 0.9682244
#6  1  5 0.2771988 -0.01009785 -0.1051373 -0.9973350 -0.9904868 -0.9954200 0.9679482 ... more cols

#Load the test data set
test <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/test/X_test.txt")[featuresWanted]
#head(test)
#         V1          V2          V3         V4         V5         V6       V41
#1 0.2571778 -0.02328523 -0.01465376 -0.9384040 -0.9200908 -0.6676833 0.9364893
#2 0.2860267 -0.01316336 -0.11908252 -0.9754147 -0.9674579 -0.9449582 0.9274036
#3 0.2754848 -0.02605042 -0.11815167 -0.9938190 -0.9699255 -0.9627480 0.9299150
#4 0.2702982 -0.03261387 -0.11752018 -0.9947428 -0.9732676 -0.9670907 0.9288814
#5 0.2748330 -0.02784779 -0.12952716 -0.9938525 -0.9674455 -0.9782950 0.9265997
#6 0.2792199 -0.01862040 -0.11390197 -0.9944552 -0.9704169 -0.9653163 0.9256632 ... more cols
testActivities <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)
#head(test)
#  V1 V1        V1          V2          V3         V4         V5         V6       V41
#1  2  5 0.2571778 -0.02328523 -0.01465376 -0.9384040 -0.9200908 -0.6676833 0.9364893
#2  2  5 0.2860267 -0.01316336 -0.11908252 -0.9754147 -0.9674579 -0.9449582 0.9274036
#3  2  5 0.2754848 -0.02605042 -0.11815167 -0.9938190 -0.9699255 -0.9627480 0.9299150
#4  2  5 0.2702982 -0.03261387 -0.11752018 -0.9947428 -0.9732676 -0.9670907 0.9288814
#5  2  5 0.2748330 -0.02784779 -0.12952716 -0.9938525 -0.9674455 -0.9782950 0.9265997
#6  2  5 0.2792199 -0.01862040 -0.11390197 -0.9944552 -0.9704169 -0.9653163 0.9256632 ...more cols

#Merge data sets
allData <- rbind(train, test)
#head(allData)
#  V1 V1        V1          V2         V3         V4         V5         V6       V41
#1  1  5 0.2885845 -0.02029417 -0.1329051 -0.9952786 -0.9831106 -0.9135264 0.9633961
#2  1  5 0.2784188 -0.01641057 -0.1235202 -0.9982453 -0.9753002 -0.9603220 0.9665611
#3  1  5 0.2796531 -0.01946716 -0.1134617 -0.9953796 -0.9671870 -0.9789440 0.9668781
#4  1  5 0.2791739 -0.02620065 -0.1232826 -0.9960915 -0.9834027 -0.9906751 0.9676152
#5  1  5 0.2766288 -0.01656965 -0.1153619 -0.9981386 -0.9808173 -0.9904816 0.9682244
#6  1  5 0.2771988 -0.01009785 -0.1051373 -0.9973350 -0.9904868 -0.9954200 0.9679482 ... more cols

# add labels
colnames(allData) <- c("subject", "activity", featuresWanted.names)
#head(allData)
#  subject activity tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX
#1       1        5     0.2885845   -0.02029417    -0.1329051   -0.9952786
#2       1        5     0.2784188   -0.01641057    -0.1235202   -0.9982453
#3       1        5     0.2796531   -0.01946716    -0.1134617   -0.9953796
#4       1        5     0.2791739   -0.02620065    -0.1232826   -0.9960915
#5       1        5     0.2766288   -0.01656965    -0.1153619   -0.9981386
#6       1        5     0.2771988   -0.01009785    -0.1051373   -0.9973350 ... more cols

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)
#head(allData)
#  subject activity tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX
#1       1 STANDING     0.2885845   -0.02029417    -0.1329051   -0.9952786
#2       1 STANDING     0.2784188   -0.01641057    -0.1235202   -0.9982453
#3       1 STANDING     0.2796531   -0.01946716    -0.1134617   -0.9953796
#4       1 STANDING     0.2791739   -0.02620065    -0.1232826   -0.9960915
#5       1 STANDING     0.2766288   -0.01656965    -0.1153619   -0.9981386
#6       1 STANDING     0.2771988   -0.01009785    -0.1051373   -0.9973350 ... more cols

#melting and casting to data frame
allData.melted <- melt(allData, id = c("subject", "activity"))
#head(allData.melted)
#  subject activity      variable     value
#1       1 STANDING tBodyAccMeanX 0.2885845
#2       1 STANDING tBodyAccMeanX 0.2784188
#3       1 STANDING tBodyAccMeanX 0.2796531
#4       1 STANDING tBodyAccMeanX 0.2791739
#5       1 STANDING tBodyAccMeanX 0.2766288
#6       1 STANDING tBodyAccMeanX 0.2771988

allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)
#head(allData.mean)
#  subject           activity tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX
#1       1            WALKING     0.2773308  -0.017383819    -0.1111481  -0.28374026
#2       1   WALKING_UPSTAIRS     0.2554617  -0.023953149    -0.0973020  -0.35470803
#3       1 WALKING_DOWNSTAIRS     0.2891883  -0.009918505    -0.1075662   0.03003534
#4       1            SITTING     0.2612376  -0.001308288    -0.1045442  -0.97722901
#5       1           STANDING     0.2789176  -0.016137590    -0.1106018  -0.99575990
#6       1             LAYING     0.2215982  -0.040513953    -0.1132036  -0.92805647 ... more cols

#writing the above data
write.table(allData.mean, "C:/Sujay/Personal/Materials/Analytics/Coursera/Getting & Cleaning Data/project/tidy.txt", row.names = FALSE, quote = FALSE)