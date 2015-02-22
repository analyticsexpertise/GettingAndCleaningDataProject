Code Book For run_analysis.R
Created By Mark Stephens
02/22/2015

See the following to understand study to which this R script data output is associated:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The following describes associated variables and measures:
Variable Name	Column Position	Source Data 	Domain	Device	Signal Type (if applicable)	Test Axis (if applicable)	Variable Measure
SubjectNumber	1	subject_train.txt and subject_test.txt		Number assigned to test subject			
ActivityName	2	activity_labels.txt, y_train.txt, y_test.txt		Activities performed during test			
TimeBodyAccMeanX	3	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw	X	Mean
TimeBodyAccMeanY	4	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw	Y	Mean
TimeBodyAccMeanZ	5	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw	Z	Mean
TimeBodyAccStdX	6	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw	X	Standard Deviation
TimeBodyAccStdY	7	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw	Y	Standard Deviation
TimeBodyAccStdZ	8	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw	Z	Standard Deviation
TimeBodyAccMagMean	9	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw		Mean
TimeBodyAccMagStd	10	X_train.txt, X.test.txt	Time	Body Accelerometer	Raw		Standard Deviation
TimeBodyAccJerkMeanX	11	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk	X	Mean
TimeBodyAccJerkMeanY	12	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk	Y	Mean
TimeBodyAccJerkMeanZ	13	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk	Z	Mean
TimeBodyAccJerkStdX	14	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk	X	Standard Deviation
TimeBodyAccJerkStdY	15	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk	Y	Standard Deviation
TimeBodyAccJerkStdZ	16	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk	Z	Standard Deviation
TimeBodyAccJerkMagMean	17	X_train.txt, X.test.txt	Time	Body Accelerometer	Jerk		Mean
TimeBodyAccJerkMagStd	18	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk		Standard Deviation
TimeBodyGyroMeanX	19	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw	X	Mean
TimeBodyGyroMeanY	20	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw	Y	Mean
TimeBodyGyroMeanZ	21	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw	Z	Mean
TimeBodyGyroStdX	22	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw	X	Standard Deviation
TimeBodyGyroStdY	23	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw	Y	Standard Deviation
TimeBodyGyroStdZ	24	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	Z	Standard Deviation
TimeBodyGyroJerkMeanX	25	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	X	Mean
TimeBodyGyroJerkMeanY	26	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	Y	Mean
TimeBodyGyroJerkMeanZ	27	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	Z	Mean
TimeBodyGyroJerkStdX	28	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	X	Standard Deviation
TimeBodyGyroJerkStdY	29	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	Y	Standard Deviation
TimeBodyGyroJerkStdZ	30	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk	Z	Standard Deviation
TimeBodyGyroMagMean	31	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw		Mean
TimeBodyGyroMagStd	32	X_train.txt, X.test.txt	Time	Body Gyroscope	Raw		Standard Deviation
TimeBodyGyroJerkMagMean	33	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk		Mean
TimeBodyGyroJerkMagStd	34	X_train.txt, X.test.txt	Time	Body Gyroscope	Jerk		Standard Deviation
TimeGravityAccMeanX	35	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw	X	Mean
TimeGravityAccMeanY	36	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw	Y	Mean
TimeGravityAccMeanZ	37	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw	Z	Mean
TimeGravityAccStdX	38	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw	X	Standard Deviation
TimeGravityAccStdY	39	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw	Y	Standard Deviation
TimeGravityAccStdZ	40	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw	Z	Standard Deviation
TimeGravityAccMagMean	41	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw		
TimeGravityAccMagStd                	42	X_train.txt, X.test.txt	Time	Gravity Accelerometer	Raw		
FreqBodyAccMeanX	43	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	X	Mean
FreqBodyAccMeanY	44	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Y	Mean
FreqBodyAccMeanZ	45	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Z	Mean
FreqBodyAccStdX	46	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	X	Standard Deviation
FreqBodyAccStdY	47	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Y	Standard Deviation
FreqBodyAccStdZ	48	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Z	Standard Deviation
FreqBodyAccMagMean	49	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw		
FreqBodyAccMagStd	50	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw		
FreqBodyAccMagMeanFreq	51	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw		Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccMeanFreqX	52	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	X	Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccMeanFreqY	53	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Y	Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccMeanFreqZ	54	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Z	Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccJerkMeanX	55	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	X	Mean
FreqBodyAccJerkMeanY	56	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Y	Mean
FreqBodyAccJerkMeanZ	57	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Raw	Z	Mean
FreqBodyAccJerkStdX	58	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk	X	Standard Deviation
FreqBodyAccJerkStdY	59	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk	Y	Standard Deviation
FreqBodyAccJerkStdZ	60	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk	Z	Standard Deviation
FreqBodyAccJerkMagMean	61	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk		Mean
FreqBodyAccJerkMagStd	62	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk		Standard Deviation
FreqBodyAccJerkMeanFreqX	63	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk	X	Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccJerkMeanFreqY	64	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk	Y	Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccJerkMeanFreqZ	65	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk	Z	Weighted average of the frequency components to obtain a mean frequency
FreqBodyAccJerkMagMeanFreq	66	X_train.txt, X.test.txt	Frequency	Body Accelerometer	Jerk		Weighted average of the frequency components to obtain a mean frequency
FreqBodyGyroMeanX	67	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	X	Mean
FreqBodyGyroMeanY	68	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	Y	Mean
FreqBodyGyroMeanZ	69	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	Z	Mean
FreqBodyGyroMagMean	70	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw		Mean
FreqBodyGyroStdX	71	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	X	Standard Deviation
FreqBodyGyroStdY	72	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	Y	Standard Deviation
FreqBodyGyroStdZ	73	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	Z	Standard Deviation
FreqBodyGyroMagStd	74	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw		Standard Deviation
FreqBodyGyroMeanFreqX	75	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	X	Weighted average of the frequency components to obtain a mean frequency
FreqBodyGyroMeanFreqY	76	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	Y	Weighted average of the frequency components to obtain a mean frequency
FreqBodyGyroMeanFreqZ                      	77	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw	Z	Weighted average of the frequency components to obtain a mean frequency
FreqBodyGyroMagMeanFreq	78	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Raw		Weighted average of the frequency components to obtain a mean frequency
FreqBodyGyroJerkMagMean	79	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Jerk		Mean
FreqBodyGyroJerkMagStd	80	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Jerk		Standard Deviation
FreqBodyGyroJerkMagMeanFreq     	81	X_train.txt, X.test.txt	Frequency	Body Gyroscope	Jerk		Weighted average of the frequency components to obtain a mean frequency
