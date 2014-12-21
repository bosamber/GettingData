README
========================================================

## Introduction
This data set is created for the Course Project in Getting and Cleaning Data to
demonstrate my ability to collect, work with, and clean a data set.

For this purpose data were downloaded from a 
[zip file on a course location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and stored in a local project folder. The data were 
imported in R, analysed, cleaned and aggregated and exported to a text file
(tidydata.txt) with a single R-program (run_analysis.R).

A data dictionary (CodeBook.md) was created using Rmarkdown/knitr. 

## HowTo
Before running the R-program run_analysis.R make sure the folder structure is
created and the data and code files are in place. Then change the file locations
in the R program (parameter part). After that run the program and check the 
results.

The name of the exported file is tidydata.txt. It is written to the export folder
and can be read with read.table.

For creating the codebook, open CodeBook.Rmd in Rstudio, change the locations to
those on your computer and KnitHTML.


### structure of run_analysis.R
The program consists of several parts that are executed in the order below. You  
can use the words in capitals to find where the code for each part begins.

1. INITIALISE clears memory, creates functions, sets parameters, checks files
2. IMPORT RAW DATA imports the data files from the UCI HAR folder in a list of
data frames (to keep the raw datasets together and to allow me to give  a name
to each data frame)
3. CHECK RAW DATA checks if the number of subjects, features and activities match 
across the datasets
4. MERGE RAW DATA column binds the data per train/test group then row binds the 
two resulting data frames. Names of the feature variables are added from the 
features file and the activity names are added as a factor.
5. RESHAPE DATA Selects requested columns, removes duplicate columns (records
too if they had been there), renames feature variables NB After reading 
[The State of Naming Conventions in R](http://journal.r-project.org/archive/2012-2/RJournal_2012-2_Baaaath.pdf) I decided to follow my own preference and used 
underscore_separated for the variable names and UpperCamelCase for functions.
6. AGGREGATE DATA calculates the mean of feature-variables per subject/activity
7. EXPORT DATA exports aggregated data to a text file and saves them as Rdata 
together with more descriptive variable labels

### folder structure and files
|folder| |files |
|------|---|-------|
|{project_directory}|  | * run_analysis.R |
|  |  | * README.md
|  |  | * CodeBook.Rmd
|  |  | * CodeBook.md
|{project_directory}/UCI HAR Dataset |  |extract the zip files here: should contain
|  |  | * README.txt
|  |  | * features_info.txt
|  |  | * features.txt
|  |  | * activity_labels.txt
|{project_directory}/UCI HAR Dataset/train |  | folder with training datasets: should contain
|  |  | * X_train.txt
|  |  | * subject_train.txt
|  |  | * y_train.txt 
|{project_directory}/UCI HAR Dataset/test  |  | folder with test datasets: should contain
|  |  | * X_test.txt
|  |  | * subject_test.txt
|  |  | * y_test.txt
|{project_directory}/export|  | folder for output: can be empty or non-existent at start
|  |  |  created by code if it does not exist yet: will contain
|  |  | * tidydata.txt
|  |  | * tidydata.Rdata

### input files
|file name           |   |description |
|--------------------|---|-------|
|X_train.txt         |   |training set with feature data|
|X_test.txt          |   |test set with feature data| 
|subject_train.txt   |   |identifier of participant for each record
|subject_test.txt    |   |identifier of participant for each record
|y_train.txt         |   |class of activity for each record
|y_test.txt          |   |class of activity for each record
|activity_labels.txt |   |activity names for each class of activity 
|features.txt        |   |original labels for each feature variable

### parameters
|parameter           |   |description |
|--------------------|---|-------|
|project_directory   |   | main folder for this project, contains code and 
|                    |   | documentation, automatically set as work folder
|data_directory      |   | subfolder that contains the downloaded files
|train_directory     |   | subfolder of data directory that contains training data
|test_directory      |   | subfolder of data directory that contains test data
|export_directory    |   | subfolder that contains output data (txt and Rdata)

