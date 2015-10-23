library(dplyr)
# Script Steps:
# -----------------------------------------------------------------------------------------------------------------------------
# Prerequisites - Get Working Directory
      dir <- getwd();
      i   <- 1
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
            subjTrain  <- tbl_df(read.fwf(paste(dirT,"/subject_train.txt", sep=""), widths = 1 ))
            colnames(Activities) <- c("actID","actName")
            colnames(yTrain)     <- "Activity"
            colnames(subjTrain)  <- "Subject"
            setwd(dir)
      ## Test Folder Reads  
            dirT <- paste(dir, "/test", sep ="");
            if (dir.exists(dirT)) setwd(dirT) else setwd(dir);
            xTest     <- tbl_df(read.table(paste(dirT,"/X_test.txt", sep=""), stringsAsFactors = FALSE ))
            yTest     <- tbl_df(read.fwf(paste(dirT,"/y_test.txt", sep=""), widths = 1 ))
            subjTest  <- tbl_df(read.fwf(paste(dirT,"/subject_test.txt", sep=""), widths = 1 ))
            colnames(yTest)    <- "Activity"
            colnames(subjTest) <- "Subject"
            ## Loop through variables to assign columnNames
            for ( i in 1:nrow(Variables)) {
                  #Make new column name tidy and unique by pasting the ordinal value
                  NewColName          <- paste(paste((gsub(",","_",(gsub("-","_",(gsub("\"","",Variables$V2[i])))))),"@", sep=""),as.character(i), sep="")
                  #print(i, NewColName)
                  colnames(xTrain)[i] <- NewColName
                  colnames(xTest)[i]  <- NewColName
            }
      ## Merge Data, Create Final Table      
            # Assumption, same cardinality, one column for each observation, limit to mean or std columns and identify the dataset by adding a new col.
            Train <- mutate(cbind(subjTrain, yTrain, select (xTrain, contains ("mean") , contains ("std"), -contains("freq"), -contains("angle") )), dataset = "Train")
            Test  <- mutate(cbind(subjTest, yTest,   select (xTest,  contains ("mean") , contains ("std"), -contains("freq"), -contains("angle") )), dataset = "Test")
            Final <- rbind(Train, Test)
            # Get the Activities Names
            Final <- inner_join (Final, Activities, by = c("Activity" ="actID"))
            # Clean-up
            rm(list=ls(pattern = "Train"))
            rm(list=ls(pattern = "Test"))
      ## Generation of tidy dataset (Group by intereset value and summarize), choose sample acceleration variables time signals "t" for project work      
            tidy <- summarize_each(group_by(Final, Subject, actName, dataset), funs(mean))
            tidy <- select (tidy, Subject, actName, dataset, contains("tBodyAcc_"))
            write.table(tidy, row.name = FALSE)
            