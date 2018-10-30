Here you can see variables names who has beenn used and done by making data tidy:

XTest: Test set
YTest: Test labels
XTrain: Training set
YTrain: Training labels.
SubjectTrain:  Each row identifies the subject who performed the activity for each window simple for data training.
SubjectTest: Each row identifies the subject who performed the activity for each window simple for data test.
Features:  List of all features.
Activity: Links the class labels with their activity name.
X: Merge Training set and Training set.
Y: Merge  Test labels and Training labels.
Subject: Merge  SubjectTrain data and SubjectTest data.
Index:  Getting features indeces which contain mean() and std() in their name.
X: getting only variables with mean/stdev in X variable.
Names:  getting names for variables 
names(X):  updating column Names for new dataset
names(Subject): Name call “SubjectID"
names(Y): Name call "Activity"
CleanedData: Merge  Training set, Training set, Test labels, Training labels, SubjectTrain data and SubjectTest data.
TidyData0:  Features average by Subject and by activity.
TidyData: Sort data by variable and by subject.

