## run_analysis.R
## Mark Stephens
## Getting and Cleaning Data 
## Coursera Course Project
## 02/22/2015

require(dplyr)
require(plyr)
require(reshape2)
require(data.table)

## This script performs the following operations:
## 1. Merges the training and the test sets to create one data set
## 2. Extracts only the mean, mean frequency, and standard deviation measurements from the merged data set
## 3. Applies descriptive names to name the activities in the data set
## 4. Lables the data set with descriptive variable names
## 5. Creates a tidy data set containing the avearge of each variable for each activity and each subject

## Refer to Readme.md for understanding of script operations
## Refer to Codebook.md for code book describing the variables

## This script assumes the following data files are located in the working directory:
## Test Set: X_test.txt, y_test.txt, subject_test.txt
## Training Set: X_train.txt, y_train.txt, subject_train.txt
## Activity Labels: activity_labels.txt

run_analysis <- function(){
  
  ## Step 1. - Merge data sets
  merged_dt <- MergeDataSets() 
  
  ## Step 2. - Extract mean, mean frequency, standard deviation
  extract_dt <- ExtractMeasures(merged_dt)
  
  ## Step 3. - Apply descriptive names to name the activities in the data set
  extract_dt <- ApplyNames(extract_dt)
  
  ## Step 4. - Label the data set with descriptive variable names
  labels_dt <- LabelVars(extract_dt)
  
  ## Step 5. Create Tidy data set containing the avearge of each variable for each activity and each subject
  return(CreateTidy(labels_dt))
  
  
  
}

## Step 1. - Merge data sets
MergeDataSets <- function(){

  ## Read and assemble Test Data
  test_x <- read.table("./X_test.txt",header=FALSE) ## Measures
  test_y <- read.table("./y_test.txt",header=FALSE) ## Activities
  test_subject <- read.table("./subject_test.txt",header=FALSE) ## Subjects
  
  test_data <- cbind(test_subject,test_y,test_x,deparse.level=0)
  ## Read and assemble Training Data
  train_x <- read.table("./X_train.txt",header=FALSE) ## Measures
  train_y <- read.table("./y_train.txt",header=FALSE) ## Activities
  train_subject <- read.table("./subject_train.txt",header=FALSE) ## Subjects
  
  train_data <- cbind(train_subject,train_y,train_x,deparse.level=0)
  
  ## Merge Test & Training Data
  
  return(rbind(test_data,train_data))
  
  
}


  
## Step 2. - Extract mean, mean frequency, standard deviation
ExtractMeasures <- function(datatable) {
  ## Pass the merged data from step 1 to this function
  ## Returns only mean, mean frequency, and standard deviation columns
  ## Column numbers for all columns associated with mean, mean frequency, and standard deviation
  ## assumes data files maintain current column number to measure relationship
  cols2extract <- c(1,2,3:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,255,256,268:273,296:298,
                    347:352,375:377,426:431,454:456,505,506,515,518,519,528,531,532,541,544,545,554)
  
  return(datatable[,cols2extract])
  
}

## Step 3. - Apply descriptive names to name the activities in the data set
ApplyNames <- function(datatable){
  ## Pass the extract data set from step 2 to this function
  ## Get activity names from activity labels file provide in data set
  ## column 1 is activity number which maps to column 2 in extract data set from step 2
  ## column 2 is descriptive name to apply to extract data set from set 2
  activity_names <- read.table("./activity_labels.txt",header=FALSE)
  
 
  return(mutate(datatable,ACTIVITY_NAME = activity_names[V1.1,2]))
  
  
}


## Step 4. - Label the data set with descriptive variable names
LabelVars <- function(datatable){
  
  old_names <- names(datatable)
  new_names <- c("SubjectNumber",
                 "ActivityNumber",
                 "TimeBodyAccMeanX",
                 "TimeBodyAccMeanY",
                 "TimeBodyAccMeanZ",
                 "TimeBodyAccStdX",
                 "TimeBodyAccStdY",
                 "TimeBodyAccStdZ",
                 "TimeGravityAccMeanX",
                 "TimeGravityAccMeanY",
                 "TimeGravityAccMeanZ",
                 "TimeGravityAccStdX",
                 "TimeGravityAccStdY",
                 "TimeGravityAccStdZ",
                 "TimeBodyAccJerkMeanX",
                 "TimeBodyAccJerkMeanY",
                 "TimeBodyAccJerkMeanZ",
                 "TimeBodyAccJerkStdX",
                 "TimeBodyAccJerkStdY",
                 "TimeBodyAccJerkStdZ",
                 "TimeBodyGyroMeanX",
                 "TimeBodyGyroMeanY",
                 "TimeBodyGyroMeanZ",
                 "TimeBodyGyroStdX",
                 "TimeBodyGyroStdY",
                 "TimeBodyGyroStdZ",
                 "TimeBodyGyroJerkMeanX",
                 "TimeBodyGyroJerkMeanY",
                 "TimeBodyGyroJerkMeanZ",
                 "TimeBodyGyroJerkStdX",
                 "TimeBodyGyroJerkStdY",
                 "TimeBodyGyroJerkStdZ",
                 "TimeBodyAccMagMean",
                 "TimeBodyAccMagStd",
                 "TimeGravityAccMagMean",
                 "TimeGravityAccMagStd",
                 "TimeBodyAccJerkMagMean",
                 "TimeBodyAccJerkMagStd",
                 "TimeBodyGyroMagMean",
                 "TimeBodyGyroMagStd",
                 "TimeBodyGyroJerkMagMean",
                 "TimeBodyGyroJerkMagStd",
                 "FreqBodyAccMeanX",
                 "FreqBodyAccMeanY",
                 "FreqBodyAccMeanZ",
                 "FreqBodyAccStdX",
                 "FreqBodyAccStdY",
                 "FreqBodyAccStdZ",
                 "FreqBodyAccMeanFreqX",
                 "FreqBodyAccMeanFreqY",
                 "FreqBodyAccMeanFreqZ",
                 "FreqBodyAccJerkMeanX",
                 "FreqBodyAccJerkMeanY",
                 "FreqBodyAccJerkMeanZ",
                 "FreqBodyAccJerkStdX",
                 "FreqBodyAccJerkStdY",
                 "FreqBodyAccJerkStdZ",
                 "FreqBodyAccJerkMeanFreqX",
                 "FreqBodyAccJerkMeanFreqY",
                 "FreqBodyAccJerkMeanFreqZ",
                 "FreqBodyGyroMeanX",
                 "FreqBodyGyroMeanY",
                 "FreqBodyGyroMeanZ",
                 "FreqBodyGyroStdX",
                 "FreqBodyGyroStdY",
                 "FreqBodyGyroStdZ",
                 "FreqBodyGyroMeanFreqX",
                 "FreqBodyGyroMeanFreqY",
                 "FreqBodyGyroMeanFreqZ",
                 "FreqBodyAccMagMean",
                 "FreqBodyAccMagStd",
                 "FreqBodyAccMagMeanFreq",
                 "FreqBodyAccJerkMagMean",
                 "FreqBodyAccJerkMagStd",
                 "FreqBodyAccJerkMagMeanFreq",
                 "FreqBodyGyroMagMean",
                 "FreqBodyGyroMagStd",
                 "FreqBodyGyroMagMeanFreq",
                 "FreqBodyGyroJerkMagMean",
                 "FreqBodyGyroJerkMagStd",
                 "FreqBodyGyroJerkMagMeanFreq",
                 "ActivityName"
                 )
  
   setnames(datatable,old=old_names,new=new_names)
  
  
  
   new_name_order <- c("SubjectNumber",
                       "ActivityNumber",
                       "ActivityName",
                       "TimeBodyAccMeanX",
                       "TimeBodyAccMeanY",
                       "TimeBodyAccMeanZ",
                       "TimeBodyAccStdX",
                       "TimeBodyAccStdY",
                       "TimeBodyAccStdZ",
                       "TimeBodyAccMagMean",
                       "TimeBodyAccMagStd",
                       "TimeBodyAccJerkMeanX",
                       "TimeBodyAccJerkMeanY",
                       "TimeBodyAccJerkMeanZ",
                       "TimeBodyAccJerkStdX",
                       "TimeBodyAccJerkStdY",
                       "TimeBodyAccJerkStdZ",
                       "TimeBodyAccJerkMagMean",
                       "TimeBodyAccJerkMagStd",
                       "TimeBodyGyroMeanX",
                       "TimeBodyGyroMeanY",
                       "TimeBodyGyroMeanZ",
                       "TimeBodyGyroStdX",
                       "TimeBodyGyroStdY",
                       "TimeBodyGyroStdZ",
                       "TimeBodyGyroJerkMeanX",
                       "TimeBodyGyroJerkMeanY",
                       "TimeBodyGyroJerkMeanZ",
                       "TimeBodyGyroJerkStdX",
                       "TimeBodyGyroJerkStdY",
                       "TimeBodyGyroJerkStdZ",
                       "TimeBodyGyroMagMean",
                       "TimeBodyGyroMagStd",
                       "TimeBodyGyroJerkMagMean",
                       "TimeBodyGyroJerkMagStd",
                       "TimeGravityAccMeanX",
                       "TimeGravityAccMeanY",
                       "TimeGravityAccMeanZ",
                       "TimeGravityAccStdX",
                       "TimeGravityAccStdY",
                       "TimeGravityAccStdZ",
                       "TimeGravityAccMagMean",
                       "TimeGravityAccMagStd",                
                       "FreqBodyAccMeanX",
                       "FreqBodyAccMeanY",
                       "FreqBodyAccMeanZ",
                       "FreqBodyAccStdX",
                       "FreqBodyAccStdY",
                       "FreqBodyAccStdZ",
                       "FreqBodyAccMagMean",
                       "FreqBodyAccMagStd",
                       "FreqBodyAccMagMeanFreq",
                       "FreqBodyAccMeanFreqX",
                       "FreqBodyAccMeanFreqY",
                       "FreqBodyAccMeanFreqZ",
                       "FreqBodyAccJerkMeanX",
                       "FreqBodyAccJerkMeanY",
                       "FreqBodyAccJerkMeanZ",
                       "FreqBodyAccJerkStdX",
                       "FreqBodyAccJerkStdY",
                       "FreqBodyAccJerkStdZ",
                       "FreqBodyAccJerkMagMean",
                       "FreqBodyAccJerkMagStd",
                       "FreqBodyAccJerkMeanFreqX",
                       "FreqBodyAccJerkMeanFreqY",
                       "FreqBodyAccJerkMeanFreqZ",
                       "FreqBodyAccJerkMagMeanFreq",
                       "FreqBodyGyroMeanX",
                       "FreqBodyGyroMeanY",
                       "FreqBodyGyroMeanZ",
                       "FreqBodyGyroMagMean",
                       "FreqBodyGyroStdX",
                       "FreqBodyGyroStdY",
                       "FreqBodyGyroStdZ",
                       "FreqBodyGyroMagStd",
                       "FreqBodyGyroMeanFreqX",
                       "FreqBodyGyroMeanFreqY",
                       "FreqBodyGyroMeanFreqZ",                      
                       "FreqBodyGyroMagMeanFreq",
                       "FreqBodyGyroJerkMagMean",
                       "FreqBodyGyroJerkMagStd",
                       "FreqBodyGyroJerkMagMeanFreq"                      
   )
    
    datatable <- data.table(datatable)
  
    ## reorder names for tidier data
    setcolorder(datatable,new_name_order)
  
  
   return(datatable)
  
  
}

## Step 5. Create Tidy data set containing the avearge of each variable for each activity and each subject
CreateTidy <- function(datatable){
  
  data_tidy <- datatable[,.(                                      TimeBodyAccMeanX=mean(TimeBodyAccMeanX,na.rm=TRUE),
                                                                  TimeBodyAccMeanY=mean(TimeBodyAccMeanY,na.rm=TRUE),
                                                                  TimeBodyAccMeanZ=mean(TimeBodyAccMeanZ,na.rm=TRUE),
                                                                  TimeBodyAccStdX=mean(TimeBodyAccStdX,na.rm=TRUE),
                                                                  TimeBodyAccStdY=mean(TimeBodyAccStdY,na.rm=TRUE),
                                                                  TimeBodyAccStdZ=mean(TimeBodyAccStdZ,na.rm=TRUE),
                                                                  TimeBodyAccMagMean=mean(TimeBodyAccMagMean,na.rm=TRUE),
                                                                  TimeBodyAccMagStd=mean(TimeBodyAccMagStd,na.rm=TRUE),
                                                                  TimeBodyAccJerkMeanX=mean(TimeBodyAccJerkMeanX,na.rm=TRUE),
                                                                  TimeBodyAccJerkMeanY=mean(TimeBodyAccJerkMeanY,na.rm=TRUE),
                                                                  TimeBodyAccJerkMeanZ=mean(TimeBodyAccJerkMeanZ,na.rm=TRUE),
                                                                  TimeBodyAccJerkStdX=mean(TimeBodyAccJerkStdX,na.rm=TRUE),
                                                                  TimeBodyAccJerkStdY=mean(TimeBodyAccJerkStdY,na.rm=TRUE),
                                                                  TimeBodyAccJerkStdZ=mean( TimeBodyAccJerkStdZ,na.rm=TRUE),
                                                                  TimeBodyAccJerkMagMean=mean(TimeBodyAccJerkMagMean,na.rm=TRUE),
                                                                  TimeBodyAccJerkMagStd=mean(TimeBodyAccJerkMagStd,na.rm=TRUE),
                                                                  TimeBodyGyroMeanX=mean(TimeBodyGyroMeanX,na.rm=TRUE),
                                                                  TimeBodyGyroMeanY=mean(TimeBodyGyroMeanY,na.rm=TRUE),
                                                                  TimeBodyGyroMeanZ=mean(TimeBodyGyroMeanZ,na.rm=TRUE),
                                                                  TimeBodyGyroStdX=mean(TimeBodyGyroStdX,na.rm=TRUE),
                                                                  TimeBodyGyroStdY=mean(TimeBodyGyroStdY,na.rm=TRUE),
                                                                  TimeBodyGyroStdZ=mean(TimeBodyGyroStdZ,na.rm=TRUE),
                                                                  TimeBodyGyroJerkMeanX=mean(TimeBodyGyroJerkMeanX,na.rm=TRUE),
                                                                  TimeBodyGyroJerkMeanY=mean(TimeBodyGyroJerkMeanY,na.rm=TRUE),
                                                                  TimeBodyGyroJerkMeanZ=mean(TimeBodyGyroJerkMeanZ,na.rm=TRUE),
                                                                  TimeBodyGyroJerkStdX=mean(TimeBodyGyroJerkStdX,na.rm=TRUE),
                                                                  TimeBodyGyroJerkStdY=mean(TimeBodyGyroJerkStdY,na.rm=TRUE),
                                                                  TimeBodyGyroJerkStdZ=mean(TimeBodyGyroJerkStdZ,na.rm=TRUE),
                                                                  TimeBodyGyroMagMean=mean(TimeBodyGyroMagMean,na.rm=TRUE),
                                                                  TimeBodyGyroMagStd=mean(TimeBodyGyroMagStd,na.rm=TRUE),
                                                                  TimeBodyGyroJerkMagMean=mean(TimeBodyGyroJerkMagMean,na.rm=TRUE),
                                                                  TimeBodyGyroJerkMagStd=mean(TimeBodyGyroJerkMagStd,na.rm=TRUE),
                                                                  TimeGravityAccMeanX=mean(TimeGravityAccMeanX,na.rm=TRUE),
                                                                  TimeGravityAccMeanY=mean(TimeGravityAccMeanY,na.rm=TRUE),
                                                                  TimeGravityAccMeanZ=mean(TimeGravityAccMeanZ,na.rm=TRUE),
                                                                  TimeGravityAccStdX=mean(TimeGravityAccStdX,na.rm=TRUE),
                                                                  TimeGravityAccStdY=mean(TimeGravityAccStdY,na.rm=TRUE),
                                                                  TimeGravityAccStdZ=mean(TimeGravityAccStdZ,na.rm=TRUE),
                                                                  TimeGravityAccMagMean=mean(TimeGravityAccMagMean,na.rm=TRUE),
                                                                  TimeGravityAccMagStd=mean(TimeBodyAccMeanX,na.rm=TRUE),                
                                                                  FreqBodyAccMeanX=mean(FreqBodyAccMeanX,na.rm=TRUE),
                                                                  FreqBodyAccMeanY=mean(FreqBodyAccMeanY,na.rm=TRUE),
                                                                  FreqBodyAccMeanZ=mean(FreqBodyAccMeanZ,na.rm=TRUE),
                                                                  FreqBodyAccStdX=mean(FreqBodyAccStdX,na.rm=TRUE),
                                                                  FreqBodyAccStdY=mean(FreqBodyAccStdY,na.rm=TRUE),
                                                                  FreqBodyAccStdZ=mean(FreqBodyAccStdZ,na.rm=TRUE),
                                                                  FreqBodyAccMagMean=mean(FreqBodyAccMagMean,na.rm=TRUE),
                                                                  FreqBodyAccMagStd=mean(FreqBodyAccMagStd,na.rm=TRUE),
                                                                  FreqBodyAccMagMeanFreq=mean(FreqBodyAccMagMeanFreq,na.rm=TRUE),
                                                                  FreqBodyAccMeanFreqX=mean(FreqBodyAccMeanFreqX,na.rm=TRUE),
                                                                  FreqBodyAccMeanFreqY=mean(FreqBodyAccMeanFreqY,na.rm=TRUE),
                                                                  FreqBodyAccMeanFreqZ=mean(FreqBodyAccMeanFreqZ,na.rm=TRUE),
                                                                  FreqBodyAccJerkMeanX=mean(FreqBodyAccJerkMeanX,na.rm=TRUE),
                                                                  FreqBodyAccJerkMeanY=mean(FreqBodyAccJerkMeanY,na.rm=TRUE),
                                                                  FreqBodyAccJerkMeanZ=mean(FreqBodyAccJerkMeanZ,na.rm=TRUE),
                                                                  FreqBodyAccJerkStdX=mean(FreqBodyAccJerkStdX,na.rm=TRUE),
                                                                  FreqBodyAccJerkStdY=mean(FreqBodyAccJerkStdY,na.rm=TRUE),
                                                                  FreqBodyAccJerkStdZ=mean(FreqBodyAccJerkStdZ,na.rm=TRUE),
                                                                  FreqBodyAccJerkMagMean=mean(FreqBodyAccJerkMagMean,na.rm=TRUE),
                                                                  FreqBodyAccJerkMagStd=mean(FreqBodyAccJerkMagStd,na.rm=TRUE),
                                                                  FreqBodyAccJerkMeanFreqX=mean(FreqBodyAccJerkMeanFreqX,na.rm=TRUE),
                                                                  FreqBodyAccJerkMeanFreqY=mean(FreqBodyAccJerkMeanFreqY,na.rm=TRUE),
                                                                  FreqBodyAccJerkMeanFreqZ=mean(FreqBodyAccJerkMeanFreqZ,na.rm=TRUE),
                                                                  FreqBodyAccJerkMagMeanFreq=mean(FreqBodyAccJerkMagMeanFreq,na.rm=TRUE),
                                                                  FreqBodyGyroMeanX=mean(FreqBodyGyroMeanX,na.rm=TRUE),
                                                                  FreqBodyGyroMeanY=mean(FreqBodyGyroMeanY,na.rm=TRUE),
                                                                  FreqBodyGyroMeanZ=mean(FreqBodyGyroMeanZ,na.rm=TRUE),
                                                                  FreqBodyGyroMagMean=mean(FreqBodyGyroMagMean,na.rm=TRUE),
                                                                  FreqBodyGyroStdX=mean(FreqBodyGyroStdX,na.rm=TRUE),
                                                                  FreqBodyGyroStdY=mean(FreqBodyGyroStdY,na.rm=TRUE),
                                                                  FreqBodyGyroStdZ=mean(FreqBodyGyroStdZ,na.rm=TRUE),
                                                                  FreqBodyGyroMagStd=mean(FreqBodyGyroMagStd,na.rm=TRUE),
                                                                  FreqBodyGyroMeanFreqX=mean(FreqBodyGyroMeanFreqX,na.rm=TRUE),
                                                                  FreqBodyGyroMeanFreqY=mean(FreqBodyGyroMeanFreqY,na.rm=TRUE),
                                                                  FreqBodyGyroMeanFreqZ=mean(FreqBodyGyroMeanFreqZ,na.rm=TRUE),                      
                                                                  FreqBodyGyroMagMeanFreq=mean(FreqBodyGyroMagMeanFreq,na.rm=TRUE),
                                                                  FreqBodyGyroJerkMagMean=mean(FreqBodyGyroJerkMagMean,na.rm=TRUE),
                                                                  FreqBodyGyroJerkMagStd=mean(FreqBodyGyroJerkMagStd,na.rm=TRUE),
                                                                  FreqBodyGyroJerkMagMeanFreq=mean(FreqBodyGyroJerkMagMeanFreq,na.rm=TRUE))
                                                                  ,by=.(SubjectNumber,ActivityName)]
  
  
  return(data_tidy)
  
}
