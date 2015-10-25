#==================================================================
##Human Activity Recognition Using Smartphones Dataset
##Version 1.0

#==================================================================
##Experiment Summary
#==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smart phone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

for more information on the experiment refer to: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##Tidy Dataset readme.txt:
#==================================================================

The tidy dataset is the result of combinig results from the human activity recgnition experiment using R script. For visualization purposes the dataset is only conformed of a few variables and objects.

#==================================================================
##List of Objects
#==================================================================	  
Activities: Contains the list of the six activities recorded
Variables: Contains the 561 type of measures, functions and transformations obtained from the experiment (Refer to fetures.info.txt)
Final: the merge of all of train and test datasets
Tidy: Activities grouped by person and dataset. Shows only the average of the tbodyAcceleraion metrics for visualization purposes.


#==================================================================
##Variables
#==================================================================
Subject <- 1:30 volunteers that performed certain activity
actName <- 1:6 Activities measured
dataset <- test or train measurments

time body acceleration in 3D (x,y,z) axis. The variable name also contains a suffix @Id for name uniqueness.


   Subject            : int  1 1 1 1 1 1 1 1 1 1 ...
   actName            : chr  "LAYING" "LAYING" "SITTING" "SITTING" ...
   dataset            : chr  "Test" "Train" "Test" "Train" ...
   tBodyAcc_mean()_X@1: num  0.273 0.266 0.274 0.275 0.278 ...
   tBodyAcc_mean()_Y@2: num  -0.0198 -0.0189 -0.0125 -0.0116 -0.0165 ...
   tBodyAcc_mean()_Z@3: num  -0.109 -0.108 -0.105 -0.106 -0.108 ...
   tBodyAcc_std()_X@4 : num  -0.97 -0.962 -0.987 -0.983 -0.986 ...
   tBodyAcc_std()_Y@5 : num  -0.959 -0.94 -0.941 -0.937 -0.939 ...
   tBodyAcc_std()_Z@6 : num  -0.962 -0.939 -0.957 -0.949 -0.949


Note:
It is importan to note that in order to execute the R script, this needs to reside at the same directory level of the 
train and test folders.