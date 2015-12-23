#INTRO

This repo contains course project files for the **Coursera - Getting and Cleaning Data Course Project**.

#PURPOSE

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.

#PROJECT SUMMARY

The goal of this project is to prepare a tidy data set that can be used for later analysis starting from a raw data set. The raw data set was built
for a research project on Human Activity Recognition Using Smartphones Data Set. This data set represents data collected from the accelerometers from the Samsung
Galaxy S smartphone. The raw data set is available following the link below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The raw data set will be cleaned and tidied up using an R script called run_analysis.R. The R script does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject (tidy.txt).

#LIST OF FILES PROVIDED IN THE REPO

* run_analysis.R - R script see project summary above
* tidy.txt - tidy data set generated using run_analysis.R
* CodeBook.md - a code book that describes the variables, the data, and any transformations or work preformed to clean up the data
* README.md - this file

#OTHER INFO

More info about the raw data set can be found here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



