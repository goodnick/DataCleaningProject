Human Activity Recognition Using Smartphones Simplified Dataset
===============================================================
Version 1.0

This dataset is a simplified and summerised version of the original dataset -
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

which in turn was based off - 
`http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`

Mean \& Standard Deviation Measurements - tidy\_data.txt
-------------------------------------------------------
This csv formatted file contains a unified dataset that combines the training and testing data from from the original. The dataset contains the follwoing data

* activity - the activity name generated from Y\_(train|test).txt for the value and activity\_labels.txt and for the label.  Possible values:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
* subject - an identifier for the subject. Range 1:30. Generated from subject_(train|test).txt
* dataset - an identifier for the original dataset the observation came from
    * test - from the test dataset
    * train - from the train dataset
* List of features - 66 measurements descibed below. Variable names where generated from features.txt

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

### Steps for data replication
The following steps where taken to produce tidy\_data.txt:

1. Combined subject\_test.txt dataset and y\_test.txt dataset with x\_test.txt using features.txt for variable names
2. Combined subject\_train.txt dataset and y\_train.txt dataset with x\_train.txt using features.txt for variable names
3. Combine both dataset
4. Extract activity, subject, dataset variables plus all variables for mean and standard deviation measurements
5. Replace activity values with radible activity labels from acitivity\_labels.txt

(You can generate this data using using instructions from the Readme)

Summarised Dataset - summary\_data.txt
--------------------------------------

This dataset is a sumarised version of the above dataset. It contains the average of each variable for each activity and each subject.
It contains the following data:

* activity - the activity that the data is grouped by
* subject - the subject that is data is secondarily grouped by
* ---dataset--- - The dataset variable was removed from this data
* Average of fetaure measurements - these features are described above

### Steps to reproduce
With the dta above:
1. Group the data by activity and then by subject
2. remove the dataset variable
3. run the mean for each group

(You can generate this data using using instructions from the Readme)
