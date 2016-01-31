################################################################################
################################################################################
#You should create one R script called run_analysis.R that does the following. 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard 
#  deviation for each measurement. 
#**3.Uses descriptive activity names to name the activities in the data set
#**4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy
#  data set with the average of each variable for each activity and each subject
################################################################################
################################################################################
library(plyr)
#WDPath = ".../UCI HAR Dataset" #Set the path to the UCI dataset on your system
setwd(WDPath)
#Preparee labeled lists as containers for the datasets
DataSets = list(NULL,NULL)
subjects = list(NULL,NULL)
names(DataSets) = c("train", "test")
names(subjects) = c("train", "test")

#Import information relevant to all data sets and
#create selectors for interesting subsets.
#These objects contain the variable names
features <- read.table("./features.txt", quote="\"", comment.char="")
meanStdFeatureElems = (grep("[mM][eE][aA][nN]|[sS][tT][dD]",features[,2]))

activityLabels <- read.table("./activity_labels.txt", quote="\"",
                             comment.char="",stringsAsFactors = F)

####Pre-process training data set####
#Import the training-set data. Add descriptive labels
#for variables and column identifying the subject of each observation
DataSets$train <- read.table( "./train/X_train.txt", quote="\"", comment.char="")
subjects$train <- read.table("./train/subject_train.txt", quote="\"", comment.char="")

DataSets$train$subject.ID = factor(subjects$train[,])
colnames(DataSets$train) = c(as.character(features[,2]),"Subject.ID")

#Import activityIds, convert Ids to descriptive label for each observation.
activitySet <- read.table("./train/y_train.txt", quote="\"", comment.char="")
activitySet = as.numeric(activitySet[,1])
activitySet = as.data.frame(mapvalues(activitySet, from = activityLabels$V1,
                                  to = activityLabels$V2))
colnames(activitySet) = "Activity.ID"
DataSets$train$Activity.ID = factor(activitySet[,])

#Add Identifier for source of the data
DataSets$train$FromSet = factor(rep(x = "Training",nrow(DataSets$train)))

################################################################################
## REPEAT THE ABOVE FOR THE TEST DATA SET

####Pre-process training data set####
#Import the training-set data. Add descriptive labels
#for variables and column identifying the subject of each observation
DataSets$test <- read.table( "./test/X_test.txt", quote="\"", comment.char="")
subjects$test <- read.table("./test/subject_test.txt", quote="\"", comment.char="")

DataSets$test$subject.ID = factor(subjects$test[,])
colnames(DataSets$test) = c(as.character(features[,2]),"Subject.ID")

#Import activityIds, convert Ids to descriptive label for each observation.
activitySet <- read.table("./test/y_test.txt", quote="\"", comment.char="")
activitySet = as.numeric(activitySet[,1])
activitySet = as.data.frame(mapvalues(activitySet, from = activityLabels$V1,
                                      to = activityLabels$V2))
colnames(activitySet) = "Activity.ID"
DataSets$test$Activity.ID = factor(activitySet[,])

#Add Identifier for source of the data
DataSets$test$FromSet = factor(rep(x = "Test",nrow(DataSets$test)))


##NOW MERGE THE DATA SETS AND SELECT THE SUBSET OF VARIABLES
##CONTAINING JUST MEANS AND STANDARD DEVIATIONS
selectedFeatures = c("Subject.ID","Activity.ID",
                     colnames(DataSets$test)[meanStdFeatureElems],"FromSet")

combinedSets = rbind.data.frame(DataSets$train[,selectedFeatures],
                                DataSets$test[,selectedFeatures])
write.table(x = combinedSets,file = "./AllSubj_Avgs.txt",row.names = F,col.names = T)
