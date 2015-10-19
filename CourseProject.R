library(dplyr)
# Script Steps:
# -----------------------------------------------------------------------------------------------------------------------------
# Prerequisites - Get Working Directory
      setwd("C:/OLDLaptop/DDrive/OldFiles/Desktop/Bills to Pay/Coursera/Data Scientist/Getting and Cleanning Data/Project/UCI HAR Dataset")
      dir <- getwd();
# -----------------------------------------------------------------------------------------------------------------------------
# Read Train, Test Files into a Train, Test Dataset(s)
      dirT <- paste(dir, "/train", sep ="");
      if (dir.exists(dirT)) setwd(dirT) else setwd(dir);
      # Create witdths vector for fixed width file X_Train.txt based on 561 different measurements
      repX <- rep(1,561) 
      xTrain <- tbl_df(read.fwf(paste(dirT,"/X_train.txt", sep=""), widths = repX ))
      yTrain <- tbl_df(read.fwf(paste(dirT,"/y_train.txt", sep=""), widths = 1 ))
      subjt  <- tbl_df(read.fwf(paste(dirT,"/subject_train.txt", sep=""), widths = 1 ))
      setwd(dir)
      dirT <- paste(dir, "/test", sep ="");
      if (dir.exists(dirT)) setwd(dirT) else setwd(dir);
      print(dirT)
      