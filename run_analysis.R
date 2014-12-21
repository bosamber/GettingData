################################################################################
## project  : Course Project Getting and Cleaning Data 
## program  : run_analysis.R
## purpose  : Prepare a tidy data set that can be used for later analysis based 
##            on Human Activity Recognition data sets from UCI Machine Learning
##            Repository 
## 
## input    : X_train.txt       training set with feature data
##            X_test.txt        test set with feature data 
##            subject_train.txt identifier of participant for each record
##            subject_test.txt  identifier of participant for each record
##            y_train.txt       class of activity for each record
##            y_test.txt        class of activity for each record
##            activity_labels.txt activity names for each class of activity 
##            features.txt      original labels for each feature variable
##
## output   : tidydata.txt
##
## docs     : CodeBook.md
##            README.md
## 
################################################################################
## date         author  description
## 2014-12-21   AB      first version
################################################################################


## INITIALISE ------------------------------------------------------------------
## ----clear objects from memory -----------------------------------------------
rm(list=ls())

## ----set a program return code to indicate if processing can continue
run_continue   <- 0

## ----functions ---------------------------------------------------------------
CheckCreateDir <- function(dir_path="~", prerequisite="Y") {
    # dir_path     : directory of which the existence has to be checked
    # prerequisite : if existence of directory is required as a prior condition 

    rc_CheckCreateDir <- 0
    # check if function parameters meet expectations
    if (dir_path == "" | !prerequisite %in% c("Y","N" )) {
        rc_CheckCreateDir <- 8
        message("CheckCreateDir: parameter error")
    } else {
    # check absence of directory
    if (!file.exists(dir_path))  {
        if (prerequisite=="Y") {
            # if presence of directory was a prior condition: end program
            rc_CheckCreateDir <- 8
            message("CheckCreateDir: required directory not found. ", dir_path)
        } else {
            # create empty directory
            dir.create(dir_path)  
            # 2do: add check if this step succeeded
        }
    }
    }
    return(rc_CheckCreateDir)
}

CheckCreateFile <- function(dir_path="~", file_name="", prerequisite="Y") {
    # dir_path     : directory where the file is expected to be found
    # file_name    : file of which the existence has to be checked
    # prerequisite : if existence of the file is required as a prior condition
    rc_CheckCreateFile <- 0
    # check if function parameters meet expectations
    if (dir_path == "" | file_name == "" | !prerequisite %in% c("Y","N" )) {
        rc_CheckCreateFile <- 8
        message("CheckCreateFile: parameter error.")
    } else {
    # check absence of file
    if (!file.exists(paste0(dir_path, file_name)))  {
        if (prerequisite=="Y") {
            # if presence of file was a prior condition: end program
            rc_CheckCreateFile <- 8
             message("CheckCreateFile: required file not found. ", 
                     paste0(dir_path, file_name))
        } else {
            # create empty file
            file.create(paste0(dir_path, file_name)) 
            # 2do: add check if this step succeeded
        }
        
    }
    } 
    return(rc_CheckCreateFile)
}

ReadRawData <- function(x){
    # Use the TryCatch function to handle errors a bit nicer
    full_name <- paste0(x[1], x[2])
    tryCatch(read.table(full_name, header=FALSE),
             warning = function(w) {message("ReadRawData: Error reading file ")
                                    return_code <- 8},
             error   = function(e) {message("ReadRawData: Error reading file ")
                                    return_code <- 8}
    )
}

CheckMeasurementRange <- function(dataframe, variable_name){
    if (  min(dataframe[variable_name]) < -1 
        | max(dataframe[variable_name]) > 1) {
        message("CheckMeasurementRange: value outside range ", variable_name)
        rc_CheckMeasurementRange <- 4
    } else {
        rc_CheckMeasurementRange <- 0
    }
    return(rc_CheckMeasurementRange)
}

ModifyVariableNames <- function(variable_name) {
    # lowercase the variable name
    variable_name  <- tolower(variable_name)
    # remove all hyphens and ()
    variable_name <- gsub("-|\\()",""                  ,variable_name)
    
    #replace name parts with more descriptive words (written out)
    variable_name <- sub("(body|gyro)", "_\\1"               , variable_name)
    variable_name <- sub("^t"         , "timedomain"         , variable_name)
    variable_name <- sub("^f"         , "frequencydomain"    , variable_name)
    variable_name <- sub("acc"        , "_accelerator"       , variable_name)
    variable_name <- sub("gyro"       , "_gyroscope"         , variable_name)
    variable_name <- sub("jerk"       , "_jerk"              , variable_name)
    variable_name <- sub("mag"        , "_magnitude"         , variable_name)
    variable_name <- sub("mean"       , "_mean"              , variable_name)
    variable_name <- sub("std"        , "_standarddeviation" , variable_name)
    variable_name <- sub("(x|y|z){1}$", "_\\1"               , variable_name)

    
    return(variable_name)
}

CreateVariableLabel <- function(variable_name) {
    if (grepl("mean\\()", variable_name)) {
        label <- "Mean of"
    } else {
        label <- "Standard deviation of"
    }
    
    if (grepl("Mag-", variable_name)) {
        label <- paste(label, "the magnitude of")
    }
    
    if (grepl("Acc", variable_name)) {
        label <- paste(label, "the linear acceleration")
    } else {
        label <- paste(label, "the angular velocity") 
    }

    if (grepl("Body", variable_name)) { 
        label <- paste(label, "of the body")
    } else { 
        label <- paste(label, "by gravity") 
    }

    re_direction <- regexpr("-[X|Y|Z]{1}$", variable_name)
    if (re_direction[1] != -1) {
        direction <- substr(variable_name, re_direction[1]+1,re_direction[1]+1)
        label     <- paste(label, 'along the', direction, 'axis')
    }

    if (grepl("Jerk", variable_name)) { 
        label <- paste(label,"(jerk part)")
    }
    
    if (substr(variable_name,1,1) == 't') {
        label <- paste(label, '(time domain)')
    } else {
        label <- paste(label, '(frequency domain)')
    }
    return(label)
}

## ---- program parameters -----------------------------------------------------
## --------- set directories ---------------------------------------------------
project_directory <-
    "~/Documents/Coursera/ 8. Getting and Cleaning Data/5_Course Project/"
data_directory    <- paste0(project_directory, "UCI HAR Dataset/")
train_directory   <- paste0(data_directory, "train/")
test_directory    <- paste0(data_directory, "test/")
export_directory  <- paste0(project_directory, "export/")

# --------- prerequisite status for each directory -----------------------------
dir_info <- matrix(c(project_directory, "Y",
                     data_directory,    "Y",
                     train_directory,   "Y",
                     test_directory,    "Y",
                     export_directory,  "N" # not a prior condition, 2b created
                     ), byrow=TRUE, ncol=2)

# --------- location, name, prerequisite status & R table for each file --------
file_info <- matrix(
            c(train_directory, "X_train.txt",         "Y", "train_features",
              test_directory,  "X_test.txt",          "Y", "test_features",
              train_directory, "y_train.txt",         "Y", "train_activity",
              test_directory,  "y_test.txt",          "Y", "test_activity",
              train_directory, "subject_train.txt",   "Y", "train_subject",
              test_directory,  "subject_test.txt",    "Y", "test_subject",
              data_directory,  "activity_labels.txt", "Y", "activity_labels",
              data_directory,  "features.txt",        "Y", "features_labels"
              ), byrow=TRUE, ncol=4)

## --------- check existence of directories ------------------------------------
if (run_continue == 0) {
    for(i in 1:nrow(dir_info)) {
        run_continue <- CheckCreateDir(dir_path=dir_info[i,1],
                                       prerequisite=dir_info[i,2])
        if (run_continue != 0) stop('Program Ended')
    }    
    rm(i)
}

## --------- check existence of raw data files ---------------------------------
if (run_continue == 0) {
    for(i in 1:nrow(file_info)) {
        run_continue <- CheckCreateFile(dir_path=file_info[i,1],
                                        file_name=file_info[i,2],
                                        prerequisite=file_info[i,3])
        if (run_continue != 0) stop('Program Ended')
    }  
    rm(i)
}

## --------- set current work directory ----------------------------------------
setwd(project_directory)

## --------- set processing date -----------------------------------------------
processing_date <- Sys.Date()

## IMPORT RAW DATA -------------------------------------------------------------
if (run_continue   == 0) {
    df_list <- list()
    for(i in 1:nrow(file_info)) {
        # read the raw data in a temporary result
        result <-  ReadRawData(file_info[i, ])
        # if the temporary result is not a data.frame something went wrong
        # write a message to the log and set a return code
        if (class(result) != 'data.frame') {
            message("IMPORT RAW DATA failed while trying to read ", 
                    file_info[i,2],"  return code ", result)
            run_continue <- result
        } else {
        # if the result is a data frame then store it in the list of data frames
        # and assign a name to this list item
            df_list[[i]]      <- result
            names(df_list)[i] <- file_info[i,4]
        }
        rm(result)        
        if (run_continue != 0) stop('Program Ended')
    } 
    rm(i)
}
# names(df_list)
# [1] "train_features"  "test_features"   "train_activity"  "test_activity"   "train_subject"  
# [6] "test_subject"    "activity_labels" "features_labels"


## CHECK RAW DATA --------------------------------------------------------------

if (run_continue == 0){
    # check if the three training data sets have an equal number of records
    if ( nrow(df_list$train_features) != nrow(df_list$train_activity)
       | nrow(df_list$train_features) != nrow(df_list$train_subject)) {
        message("CHECK RAW DATA different numbers of training records ")
        run_continue <- 8
    }
    # check if the three test data sets have an equal number of records
    if ( nrow(df_list$test_features) != nrow(df_list$test_activity)
       | nrow(df_list$test_features) != nrow(df_list$test_subject)) {
        message("CHECK RAW DATA different numbers of test records ")
        run_continue <- 8
    }
    # check if the number of variables in the two feature data sets equals the
    #       number of feature labels
    if ( ncol(df_list$train_features) != nrow(df_list$features_labels)
       | ncol(df_list$test_features)  != nrow(df_list$features_labels)) {
        message("CHECK RAW DATA different numbers of feature variables ")
        run_continue <- 8
    }
    # check if the activity numbers in the two activity data sets are the same 
    #       as the numbers in the data set with activity labels
    if (!setequal(unique(df_list$train_activity$V1)
                  , df_list$activity_labels$V1)){
        message("CHECK RAW DATA different numbers of activities ")
        run_continue <- 8
    }
    if (run_continue != 0) stop('Program Ended')
}

## MERGE RAW DATA --------------------------------------------------------------
# Whether the data should be subsetted first depends on expected changes in 
# functionality and the storage and processing capacity available. These data 
# sets are very small so I'll combine them first to have more flexibility later.
if (run_continue == 0){
    # ---- add column with indicator for test/training data 
    df_list$train_subject$group     <- 'train'
    df_list$test_subject$group      <- 'test'
 
    # ---- rename columns for input datasets to avoid confusion later on -------
    names(df_list$train_features)   <- df_list$features_labels$V2
    names(df_list$train_activity)   <- 'activity_number'
    names(df_list$train_subject)    <- c('subject_id', 'group')
    
    names(df_list$test_features)    <- df_list$features_labels$V2
    names(df_list$test_activity)    <- 'activity_number'
    names(df_list$test_subject)     <- c('subject_id', 'group')
    
    names(df_list$activity_labels)  <-c('activity_number','activity_label')
    
#     names(df_list$train_subject)
#     names(df_list$test_subject)

    # ---- combine training and test data separately (cbind)--------------------
    # --------- then append (rbind) --------------------------------------------
    df_combined <- rbind(cbind(df_list$train_features, 
                               df_list$train_activity,
                               df_list$train_subject),
                         cbind(df_list$test_features, 
                               df_list$test_activity,
                               df_list$test_subject)
                        )
    # ---- add activity labels as a factor variable
    df_combined$activity_label         <- as.factor(df_combined$activity_number)
    levels(df_combined$activity_label) <- df_list$activity_labels$activity_label 
#     table(df_combined$activity_label, df_combined$activity_number)

#     names(df_combined)    

    # ---- check if the data frame exists and had the expected number of -------
    # --------- records and variables ------------------------------------------
    if (!is.data.frame(df_combined)
        | nrow(df_combined) != 
            sum(nrow(df_list$train_features), nrow(df_list$test_features))
        | ncol(df_combined) !=
            sum(ncol(df_list$train_features), ncol(df_list$train_activity),
                ncol(df_list$train_subject), 1)
    ) {
        message("MERGE RAW DATA failed: number of records/variables incorrect")
        run_continue <- 8
    } else {
        # if the result is okay, remove the raw data
        rm(df_list)    
    }
    
    if (run_continue != 0) stop('Program Ended')
}

## RESHAPE DATA ----------------------------------------------------------------
if (run_continue == 0){
    # ---- clean up misnamed variables -----------------------------------------
    # --------- misnamed frequency variables with BodyBody in it instead of Body
    names(df_combined)     <- sub("BodyBody", "Body", names(df_combined))

    # ---- extract mean and standard deviation for each measurement ------------
    # --------- by selecting mean() and std() I avoid the duplicate variable ---
    # --------- names of the bandEnergy transformations ------------------------
    # --------- meanFreq() is excluded because it is not a mean of measurement -
    variables_measurement <- grep("mean\\()|std\\()", 
                                  names(df_combined), 
                                  value=TRUE)
    df_extract            <- subset(df_combined,
                                    select=c("group", 
                                             "subject_id", 
                                             "activity_label",
                                             variables_measurement))
    

    # ---- check for duplicate records and duplicate variables -----------------
    duplicate_rows    <- duplicated(df_extract, MARGIN=1)
    if (sum(duplicate_rows) !=0 ) {
        message("RESHAPE DATA: duplicate records found in selection, removed")
        # remove duplicate records
        df_extract   <- df_extract[!duplicate_rows, ]
        run_continue <- 4 
    }
    duplicate_columns <- duplicated(lapply(df_extract, summary))
    if (sum(duplicate_columns) != 0) {
        message("RESHAPE DATA: duplicate columns found in selection, removed")
        
        # analysis
        names_duplicate_columns <- names(df_extract[which(duplicate_columns)])
        message("variables ", names_duplicate_columns ,
                " are duplicates of other columns")
        
        # visual test (2do: automate )
        correlation_test <- cor(df_extract[, which(duplicate_columns)],
                                df_extract[, variables_measurement])
        # in this case there are two variables that seem to be miscalculated
        #    test["tGravityAccMag-mean()",] -> identical to tBodyAccMag-mean()
        #    test["tGravityAccMag-std()",] -> identical to tBodyAccMag-std()
        rm(correlation_test)
        names_duplicate_columns <- c(names_duplicate_columns
                                     , "tBodyAccMag-mean()"
                                     , "tBodyAccMag-std()")
        
        # remove duplicate columns from data frame & list of variables
        keep_vars  <- !(names(df_extract) %in% names_duplicate_columns)
        df_extract <- df_extract[ , !(names(df_extract) %in% names_duplicate_columns)]
        rm(keep_vars)
        variables_measurement <- 
            variables_measurement[!variables_measurement %in% names_duplicate_columns]
        
        run_continue <- 4 
    }

    # ---- check the range of the feature variables (should be -1 to 1) --------
    for (i in variables_measurement) {
        if (CheckMeasurementRange(df_extract,i) != 0) {
            run_continue <- 4
        }
    }
    rm(i)

    # ---- replace feature variable labels with descriptive variable names -----
    names(df_extract)[4:ncol(df_extract)] <- sapply(variables_measurement, 
                                                    FUN=ModifyVariableNames)
}

## AGGREGATE DATA --------------------------------------------------------------
# ---- calculate average of each measurement per subject, per activity ---------
# 2do: add error handling
df_extract$activity_label <- as.character(df_extract$activity_label)
df_aggregate <- aggregate(. ~ activity_label + subject_id, 
                  data=subset(df_extract, select=-group),
                  FUN=mean)
# 2do: find more efficient method for this aggregation

## EXPORT DATA -----------------------------------------------------------------
# ---- write the aggregated data to a flatfile ---------------------------------
# ----------. txt, write.table() using row.name=FALSE 
# 2do: add error handling
write.table(df_aggregate, 
            file=paste0(export_directory,"tidydata.txt"),
            row.names=FALSE,
            append=FALSE
            )
# 2do: figure out how to limit the number of decimals written by R
#  options("digits") had effect on print() not on write.table()
#  possibly use round() first on dataframe

# ---- create variable_labels for code book ------------------------------------
labels_measurement        <- sapply(variables_measurement, FUN=CreateVariableLabel)
names(labels_measurement) <- names(df_aggregate)[3:ncol(df_aggregate)]
save(df_aggregate, labels_measurement,
     file=paste0(export_directory, "tidydata.Rdata"))
