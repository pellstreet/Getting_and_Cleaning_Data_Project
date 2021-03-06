# INTRO

This Codebook describes the variables, the data, and transformations performed to clean up the raw data set used for the *Coursera - Getting and Cleaning Data Course Project* (see below)

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The raw data set is the result of an experiment that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. 
The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was
selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#DATA

List of raw data files used in the Course Project analysis

* from the training data

       * subject_train.txt : Each row identifies the subject who performed the activity for each window sample (from 1 to 30).
       * X_train.txt :  Training Set.
       * y_train.txt :  Training Labels.

* from the test data

       * subject_test.txt : Each row identifies the subject who performed the activity for each window sample(from 1 to 30).
       * X_test.txt  : Test Set.
       * y_test.txt  : Test Labels.

* from the UCI HAR Dataset folder

       * activity_labels.txt   : Links the class labels with their activity name.
       * features.txt   :   List of all features.

#VARIABLES USED IN THE R SCRIPT

* test_m ,  train_m : contain the merged data (cbind) from the corresponding test and training raw data set (3 .txt files merged for each variable).
* dataset : is a dataframe with merged (rbind) data from test_m and train_m. Note that the 'dataset' variable is transformed throughout the script, see chapter R SCRIPT
* all_names :  contains the correct column names for the  merged  data set, note that this vector contains also names for the "subject" and "activity" columns.
               The "subject" column contains an ID (from 1 to 30) representing each volunteer who took the test, the "activity" column is a list of 6 activities performed by the volunteers
               (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* ac_lab : contains activities, this dataframe has two columns, column 1 is activity 1 to 6. Column 2 has the respective activity name
           (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* tidy  : is a data frame with the final tidy data set.

#R SCRIPT

* The raw data is downloaded and unzipped in the working directory.
* The script reads in the activity labels (ac_lab).
* The script reads in the features (column names) of the data set (total:561), some of the features names are amended to make them more descriptive.
* "subject" and "activity" names are appended to the features vector, to generate a list of names (all_names) for the merged data set (dataset).
* The .txt files from the test and training folders are imported and merged together, a 10,299 rows by 563 columns is generated.
* the column names (all_names) are added to the merged data set(dataset).
* the merged data set is initially cleaned up, dataset is ordered by "subject" and "activity" and activity column is moved next to the subject column.
* the activity names are replaced using descriptive names (1 to 6 is replaced by WALKING.....LAYING) using the ac_lab  data frame.
* only the measurements on the mean and standard deviation for each measurement were extracted from the dataset.
* a second, independent tidy data set (tidy) with the average of each variable for each activity and each subject was generated. Tidy contains 180 rows by 81 colulmns.
* the tidy data frame is written to a .txt file called tidy.txt.

#TIDY DATA SET COLUMN VARIABLE NAMES

Here below is a list of colum variable names for the tidy data set

subject<br>
activity<br>
tBodyAccMean-X<br>
tBodyAccMean-Y<br>
tBodyAccMean-Z<br>
tBodyAccStd-X<br>
tBodyAccStd-Y<br>
tBodyAccStd-Z<br>
tGravityAccMean-X<br>
tGravityAccMean-Y<br>
tGravityAccMean-Z<br>
tGravityAccStd-X<br>
tGravityAccStd-Y<br>
tGravityAccStd-Z<br>
tBodyAccJerkMean-X<br>
tBodyAccJerkMean-Y<br>
tBodyAccJerkMean-Z<br>
tBodyAccJerkStd-X<br>
tBodyAccJerkStd-Y<br>
tBodyAccJerkStd-Z<br>
tBodyGyroMean-X<br>
tBodyGyroMean-Y<br>
tBodyGyroMean-Z<br>
tBodyGyroStd-X<br>
tBodyGyroStd-Y<br>
tBodyGyroStd-Z<br>
tBodyGyroJerkMean-X<br>
tBodyGyroJerkMean-Y<br>
tBodyGyroJerkMean-Z<br>
tBodyGyroJerkStd-X<br>
tBodyGyroJerkStd-Y<br>
tBodyGyroJerkStd-Z<br>
tBodyAccMagnitudenitudeMean<br>
tBodyAccMagnitudenitudeStd<br>
tGravityAccMagnitudenitudeMean<br>
tGravityAccMagnitudenitudeStd<br>
tBodyAccJerMagnitudeMean<br>
tBodyAccJerMagnitudeStd<br>
tBodyGyroMagnitudeMean<br>
tBodyGyroMagnitudeStd<br>
tBodyGyroJerMagnitudeMean<br>
tBodyGyroJerMagnitudeStd<br>
fBodyAccMean-X<br>
fBodyAccMean-Y<br>
fBodyAccMean-Z<br>
fBodyAccStd-X<br>
fBodyAccStd-Y<br>
fBodyAccStd-Z<br>
fBodyAccMeanFreq-X<br>
fBodyAccMeanFreq-Y<br>
fBodyAccMeanFreq-Z<br>
fBodyAccJerkMean-X<br>
fBodyAccJerkMean-Y<br>
fBodyAccJerkMean-Z<br>
fBodyAccJerkStd-X<br>
fBodyAccJerkStd-Y<br>
fBodyAccJerkStd-Z<br>
fBodyAccJerkMeanFreq-X<br>
fBodyAccJerkMeanFreq-Y<br>
fBodyAccJerkMeanFreq-Z<br>
fBodyGyroMean-X<br>
fBodyGyroMean-Y<br>
fBodyGyroMean-Z<br>
fBodyGyroStd-X<br>
fBodyGyroStd-Y<br>
fBodyGyroStd-Z<br>
fBodyGyroMeanFreq-X<br>
fBodyGyroMeanFreq-Y<br>
fBodyGyroMeanFreq-Z<br>
fBodyAccMagnitudenitudeMean<br>
fBodyAccMagnitudenitudeStd<br>
fBodyAccMagnitudenitudeMeanFreq<br>
fBodyBodyAccJerMagnitudeMean<br>
fBodyBodyAccJerMagnitudeStd<br>
fBodyBodyAccJerMagnitudeMeanFreq<br>
fBodyBodyGyroMagnitudeMean<br>
fBodyBodyGyroMagnitudeStd<br>
fBodyBodyGyroMagnitudeMeanFreq<br>
fBodyBodyGyroJerMagnitudeMean<br>
fBodyBodyGyroJerMagnitudeStd<br>
fBodyBodyGyroJerMagnitudeMeanFreq<br>

A description of the above variable names can be found in the features_info.txt file located in the 'UCI HAR Dataset' folder in the raw dataset.
For a description of the "subject" and "activity" variables see chapter VARIABLES USED IN THE R SCRIPT