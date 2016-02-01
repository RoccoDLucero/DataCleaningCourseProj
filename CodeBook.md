a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

UCI_Tidy assigns variable names to the columns of each data set according to the mapping provided in features.txt. Activity codes are converted to activity names by the mapping provided in activity_labels.txt. Subject IDs are added for each observation by a column binding (for example subject_train.txt is added as a column to X_train.txt). A "FromSet" column is added to indicate the subject placement in the test or training sets within the UCI HAR machine learning experiment. Finally UCI_Tidy.R selects only variable which represent the estimated mean and standart deviations for the given measurement and then combines the pared-down test and training data sets from UCI HAR 1.0 to a single data frame and writes to AllSubj_Avgs.txt.

The description below is modified from features-info.txt provided with the UCI HAR data set 1.0: 
Feature Selection 
=================
Data Collection:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

===================================================
The variable names described here are listed below:
Prefixes: t refers to time domain data values
          f refers to frequency domain data values
Suffixes: -mean: Mean value
          -std: Standard deviation

 [1] "subjectID"                           "activityID"                         
 [3] "tBodyAcc-mean-X"                      "tBodyAcc-mean-Y"                     
 [5] "tBodyAcc-mean-Z"                      "tBodyAcc-std-X"                      
 [7] "tBodyAcc-std-Y"                       "tBodyAcc-std-Z"                      
 [9] "tGravityAcc-mean-X"                   "tGravityAcc-mean-Y"                  
[11] "tGravityAcc-mean-Z"                   "tGravityAcc-std-X"                   
[13] "tGravityAcc-std-Y"                    "tGravityAcc-std-Z"                   
[15] "tBodyAccJerk-mean-X"                  "tBodyAccJerk-mean-Y"                 
[17] "tBodyAccJerk-mean-Z"                  "tBodyAccJerk-std-X"                  
[19] "tBodyAccJerk-std-Y"                   "tBodyAccJerk-std-Z"                  
[21] "tBodyGyro-mean-X"                     "tBodyGyro-mean-Y"                    
[23] "tBodyGyro-mean-Z"                     "tBodyGyro-std-X"                     
[25] "tBodyGyro-std-Y"                      "tBodyGyro-std-Z"                     
[27] "tBodyGyroJerk-mean-X"                 "tBodyGyroJerk-mean-Y"                
[29] "tBodyGyroJerk-mean-Z"                 "tBodyGyroJerk-std-X"                 
[31] "tBodyGyroJerk-std-Y"                  "tBodyGyroJerk-std-Z"                 
[33] "tBodyAccMag-mean"                     "tBodyAccMag-std"                     
[35] "tGravityAccMag-mean"                  "tGravityAccMag-std"                  
[37] "tBodyAccJerkMag-mean"                 "tBodyAccJerkMag-std"                 
[39] "tBodyGyroMag-mean"                    "tBodyGyroMag-std"                    
[41] "tBodyGyroJerkMag-mean"                "tBodyGyroJerkMag-std"                
[43] "fBodyAcc-mean-X"                      "fBodyAcc-mean-Y"                     
[45] "fBodyAcc-mean-Z"                      "fBodyAcc-std-X"                      
[47] "fBodyAcc-std-Y"                       "fBodyAcc-std-Z"                      
[49] "fBodyAcc-meanFreq-X"                  "fBodyAcc-meanFreq-Y"                 
[51] "fBodyAcc-meanFreq-Z"                  "fBodyAccJerk-mean-X"                 
[53] "fBodyAccJerk-mean-Y"                  "fBodyAccJerk-mean-Z"                 
[55] "fBodyAccJerk-std-X"                   "fBodyAccJerk-std-Y"                  
[57] "fBodyAccJerk-std-Z"                   "fBodyAccJerk-meanFreq-X"             
[59] "fBodyAccJerk-meanFreq-Y"              "fBodyAccJerk-meanFreq-Z"             
[61] "fBodyGyro-mean-X"                     "fBodyGyro-mean-Y"                    
[63] "fBodyGyro-mean-Z"                     "fBodyGyro-std-X"                     
[65] "fBodyGyro-std-Y"                      "fBodyGyro-std-Z"                     
[67] "fBodyGyro-meanFreq-X"                 "fBodyGyro-meanFreq-Y"                
[69] "fBodyGyro-meanFreq-Z"                 "fBodyAccMag-mean"                    
[71] "fBodyAccMag-std"                      "fBodyAccMag-meanFreq"                
[73] "fBodyBodyAccJerkMag-mean"             "fBodyBodyAccJerkMag-std"             
[75] "fBodyBodyAccJerkMag-meanFreq"         "fBodyBodyGyroMag-mean"               
[77] "fBodyBodyGyroMag-std"                 "fBodyBodyGyroMag-meanFreq"           
[79] "fBodyBodyGyroJerkMag-mean"            "fBodyBodyGyroJerkMag-std"            
[81] "fBodyBodyGyroJerkMag-meanFreq"        "angle(tBodyAccMean,gravity)"         
[83] "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                
[87] "angle(Y,gravityMean)"                 "angle(Z,gravityMean)"                
[89] "fromSet"   
