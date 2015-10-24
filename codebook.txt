The following codebook provides an overview of the steps taken to create a tidy dataset
based on the Samsung collated data for the following experiment:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Experiment Summary
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smart phone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

for more information on the experiment refer to: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Course Project Results:
==================================================================
Obtained using the following Rstudio and OS platform and the "dplyr" library

platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
status                                     
language       R                           
version.string R version 3.2.1 (2015-06-18)
nickname       World-Famous Astronaut   


Script Steps: 
==================================================================
1.- Prerequisites:
==================================================================
	a) In order to successfully execute the program the .R file must reside at the same level of the test and train folders.
		i.e The test and train folder must be siblings of the .R file.
		e.g. c:\project\train {folder}
			c:\project\test  {folder}
			c:\project\run_anlysis.R
	b) Initialize a counter: I = 1		
	
==================================================================
2.- Read Generic Tables
==================================================================
	Read features.txt & activity_labels.txt into R tables
	
==================================================================
3.- Read "train" Folder files
==================================================================
	a) Read the following files from the train folders
            X_train.txt"
            y_train.txt"
            subject_train
	b) Assign readable columnNames to general and train files.		
	
==================================================================
4.- Read "test" Folder files
==================================================================	
    a) Read the following files from the train folders
            X_test.txt"
            y_test.txt"
            subject_test
	b) Assign readable columnNames to general and train files.
	
==================================================================
5.- Cleanse and make unique column names for the X_train, Xtest datasets
==================================================================	
                  colnames(xTrain)[i] <- NewColName
                  colnames(xTest)[i]  <- NewColName

==================================================================
6.- Merge R datasets: Assumption made on the same cardinality from all of the tables.
==================================================================
	a) Merge columns on same type of observations
	b) Merge rows on the consolidated datasets
	c) Lookup missing information form generic tables
	d) cleanup and remove temporary objects
	
==================================================================
7.- Generation of tidy dataset
==================================================================
	a) group_by on interested values only
	b) summarize each of the interested columns by applying the average function.
	c) write result to table.
	
      
	  
	  
==================================================================
List of Objects
==================================================================	  
Activities: Contains the list 6 of Activities recorded
Variables: Contains the 561 type of measures, functions and transformations obtained from the experiment. (Refer to fetures.info.txt)
Final: Merges of train and test datasets
Tidy: Activities grouped by person and dataset. Shows only the average of the tbodyAcceleraion metrics for visualization purposes.
