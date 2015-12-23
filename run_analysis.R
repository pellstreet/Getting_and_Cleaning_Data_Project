#Coursera Getting and Cleaning Data Course Project

wodi<-getwd()

filename <- "getdata_projectfiles_UCI HAR Dataset.zip" 

# download and unzip the dataset: 

if (!file.exists(filename)){ 
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip " 
  download.file(fileURL, filename, method="curl") 
  }   
if (!file.exists("UCI HAR Dataset")) {  
   unzip(filename)  
  } 

#read in activity labels and features 

ac_lab<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses=c("character", "character"))

features<-read.table("UCI HAR Dataset/features.txt",header=FALSE,colClasses=c("character", "character"))

features2<-(features[[2]])

# make the feature names more descriptive

features2 = gsub('-mean', 'Mean', features2) 
features2 = gsub('-std', 'Std', features2) 
features2 = gsub("AccMag","AccMagnitude",features2)
features2 = gsub("\\()","",features2)
features2 = gsub("AccMag","AccMagnitude",features2)
features2 = gsub("JerkMag","JerMagnitude",features2) 
features2 = gsub("GyroMag","GyroMagnitude",features2) 

# add "subject" and "activity" to the list of features, vector to be used to assign the data frame names

all_names<-append(features2,"subject",after=0)
all_names<-append(all_names,"activity",after=length(all_names))

# read in the 3 test .txt files and merge them

setwd("./UCI HAR Dataset/test/")

test_names<-list.files(pattern = "\\.txt$")

test<-lapply(test_names,read.table,header=FALSE)

test_m<-do.call(cbind, test)

# read in the 3 train .txt files and merge them

setwd("../")

setwd("./train/")

train_names<-list.files(pattern = "\\.txt$")

train<-lapply(train_names,read.table,header=FALSE)

train_m<-do.call(cbind, train)

#merge test and train data frames

dataset<-rbind(test_m,train_m)

#add names to the combined (test and train) dataframe

colnames(dataset)<-all_names

# order the dataset by subject and activity columns

dataset<-dataset[order(dataset$subject,dataset$activity),]

#move the activity column next to the subject column

dataset<-dataset[c(1,563,2:562)]

#name the activity in the dataset with more descriptive names

for (row in 1:nrow(ac_lab))

dataset$activity[dataset$activity==ac_lab[row,1]]<-ac_lab[row,2]

#select only columns containing standard deviation and mean in names (include subject and activity columns)

dataset<-dataset[,grepl("Mean|Std|subject|activity", names(dataset))]

#work out average of each variable for each activity and each subject.

library(dplyr)

tidy<-aggregate(dataset[,(3:81)],list(activity=dataset$activity,subject=dataset$subject),FUN=mean)

#move the activity column after the subject column

tidy<-tidy[c(2,1,3:81)]

#write the tidy data frame to a file

setwd(wodi)

write.table(tidy, './tidy.txt',row.names=FALSE,sep='\t')


