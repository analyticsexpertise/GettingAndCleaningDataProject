Readme for run_analysis.R
Created By Mark Stephens
02/22/2015

This script performs the following operations:
1. Merges the training and the test sets to create one data set
2. Extracts only the mean, mean frequency, and standard deviation measurements from the merged data set
3. Applies descriptive names to name the activities in the data set
4. Lables the data set with descriptive variable names
5. Creates a tidy data set containing the avearge of each variable for each activity and each subject

This script assumes the following data files are located in the working directory:
Test Set: X_test.txt, y_test.txt, subject_test.txt
Training Set: X_train.txt, y_train.txt, subject_train.txt
Activity Labels: activity_labels.txt

To run the script and store resulting output to data table, type the following at command line in console: <datatablename> <- run_analysis()
Where <datatablename> is the object name for your data table in which to store the tidy data output per step 5.

To run this script the following libraries are required:

dplyr, plyr, reshape2, data.table

When sourced, the script calls the require function to for these libraries.

The script contains the following functions:

run_analysis - main function used at command line to execute operations 1-5 creating the tidy data output

MergeDataSets - Merges the training and the test sets to create one data set

ExtractMeasures - Extract mean, mean frequency, standard deviation

ApplyNames - Apply descriptive names to name the activities in the data set

LableVars - Label the data set with descriptive variable names

CreateTiday - Create Tidy data set containing the avearge of each variable for each activity and each subject

Upon execution of run_analysis function, run_analysis calls the functions in the order listed above.

