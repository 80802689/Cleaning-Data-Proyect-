## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## configure the working directory, download the file to be read

getwd()
setwd("C:/Users/cesar ascencio/Desktop/Data_Science_especialización/Curso3 cleaning data/Proyecto")
install.packages("data.table")
library(data.table)
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./cesar Data1.zip')){
  download.file(url,'./cesar Data1.zip', mode = 'wb')
  unzip("cesar Data1.zip", exdir = getwd())
}


########### 1 Merges the training and the test sets to create one data set.


## # Load and process X_test & y_test data

XTest<- read.table("UCI HAR Dataset/test/X_test.txt")
YTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")

## train data

XTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

## features and activity

features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

      ##Part1 - merges train and test data in one dataset (full dataset at the end)

X<-rbind(XTest, XTrain)
Y<-rbind(YTest, YTrain)
Subject<-rbind(SubjectTest, SubjectTrain)
dim(X); dim(Y); dim(Subject)

## 2 Extracts only the measurements on the mean and standard deviation for each measurement.

index<-grep("mean\\(\\)|std\\(\\)", features[,2]) ##getting features indeces which contain mean() and std() in their name
length(index) ## count of feature
X<-X[,index]  ## getting only variables with mean/stdev
dim(X)

## 3 Uses descriptive activity names to name the activities in the data set

Y[,1]<-activity[Y[,1],2] ## ## replacing numeric values with lookup value from activity.txt; won't reorder Y set

### 4 Appropriately labels the data set with descriptive variable names.

names<-features[index,2] ## getting names for variables
head(features)  
names(X)<-names ## updating colNames for new dataset
names(Subject)<-"SubjectID"
names(Y)<-"Activity"
    
CleanedData<-cbind(Subject, Y, X)
head(CleanedData[,c(1:4)]) ## see first 5 files
dim(CleanedData)


### 5  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

CleanedData2<-data.table(CleanedData)
names(CleanedData2)
TidyData <- CleanedData2[, lapply(.SD, mean), by = 'SubjectID,Activity'] ## features average by Subject and by activity
dim(TidyData)
head(TidyData[,1:4])

TidyData <- TidyData[order(SubjectID,Activity),]  ##Sort data by variable and by subject	
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)  ## Download the data in txt












