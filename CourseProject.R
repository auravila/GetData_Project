library(dplyr)
# Script Steps:
# -----------------------------------------------------------------------------------------------------------------------------
# Prerequisites - Get Working Directory
      setwd("C:/OLDLaptop/DDrive/OldFiles/Desktop/Bills to Pay/Coursera/Data Scientist/Getting and Cleanning Data/Project/UCI HAR Dataset")
      dir <- getwd();
# -----------------------------------------------------------------------------------------------------------------------------
# Read Train, Test Files into a Train, Test Dataset(s)
      dirT <- dir
      ## Root Reads
            Variables   <- tbl_df(read.table(paste(dirT,"/features.txt", sep=""), stringsAsFactors = FALSE))
            Activities  <- tbl_df(read.table(paste(dirT,"/activity_labels.txt", sep=""), stringsAsFactors = FALSE ))
      ## Train Folder Reads      
            dirT <- paste(dir, "/train", sep ="");
            if (dir.exists(dirT)) setwd(dirT) else setwd(dir);
            xTrain     <- tbl_df(read.table(paste(dirT,"/X_train.txt", sep=""), stringsAsFactors = FALSE ))
            yTrain     <- tbl_df(read.fwf(paste(dirT,"/y_train.txt", sep=""), widths = 1 ))
            subjtrain  <- tbl_df(read.fwf(paste(dirT,"/subject_train.txt", sep=""), widths = 1 ))
            setwd(dir)
            # Assumption, same cardinality, one column for each observation
            Train <- cbind(subjtrain, yTrain, xTrain)
      ## Test Folder Reads  
            dirT <- paste(dir, "/test", sep ="");
            if (dir.exists(dirT)) setwd(dirT) else setwd(dir);
            xTest     <- tbl_df(read.table(paste(dirT,"/X_test.txt", sep=""), stringsAsFactors = FALSE ))
            yTest     <- tbl_df(read.fwf(paste(dirT,"/y_test.txt", sep=""), widths = 1 ))
            subjtest  <- tbl_df(read.fwf(paste(dirT,"/subject_test.txt", sep=""), widths = 1 ))
            Test <- cbind(subjtest, yTest, xTest)