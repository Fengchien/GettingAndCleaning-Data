run_analysis <- function() {

	#1. Merges the training and the test sets to create one data set.
	print("Start Merging the training and the test sets to create one data set...")
	xtrain <- read.table("./Dataset/train/X_train.txt", sep="", header=F)
	xtest <- read.table("./Dataset/test/X_test.txt", sep="", header=F)
	allset <- rbind(xtrain, xtest)
	#write.table(allset, file="./output/allset.txt", sep=" ", row.name=FALSE)
	
	#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	print("Start Extracting only the measurements on the mean and standard deviation for each measurement...")
	ft <- read.table("./Dataset/features.txt", sep="", header=F)
	names(ft) <- c("idx", "ftName")
	subft <- subset(ft, grepl("Mean",ftName) | grepl("mean",ftName) | grepl("std",ftName))
	ftIdxVec <- subft$idx
	allsubset <- allset[, ftIdxVec]
	#write.table(allsubset, file="./output/allsub.txt", sep=" ", row.name=FALSE)
	
	#3. Using descriptive activity names to name the activities in the data set
	print("Start Using descriptive activity names to name the activities in the data set...")
	subjectxtrain = read.table("./Dataset/train/subject_train.txt", header=F)
	subjectxtest = read.table("./Dataset/test/subject_test.txt", header=F)
	allsubject = rbind(subjectxtrain, subjectxtest)
	allsubsbj = cbind(allsubset, allsubject)
	#write.table(allsubsbj, file="./output/allsubsbj.txt", sep=" ", row.name=FALSE)
	
	# Adding the subject data to the measurement data frame 
	print("Start Adding the subject data to the measurement data frame...")
	actxtrain = read.table("./Dataset/train/Y_train.txt", header=F)
	actxtrain[actxtrain=="1"]<-"WALKING"
	actxtrain[actxtrain=="2"]<-"WALKING_UPSTAIRS"
	actxtrain[actxtrain=="3"]<-"WALKING_DOWNSTAIRS"
	actxtrain[actxtrain=="4"]<-"SITTING"
	actxtrain[actxtrain=="5"]<-"STANDING"
	actxtrain[actxtrain=="6"]<-"LAYING"
	actxtest = read.table("./Dataset/test/Y_test.txt", header=F)
	actxtest[actxtest=="1"]<-"WALKING"
	actxtest[actxtest=="2"]<-"WALKING_UPSTAIRS"
	actxtest[actxtest=="3"]<-"WALKING_DOWNSTAIRS"
	actxtest[actxtest=="4"]<-"SITTING"
	actxtest[actxtest=="5"]<-"STANDING"
	actxtest[actxtest=="6"]<-"LAYING"
	allact = rbind(actxtrain, actxtest)
	allsubsbjact = cbind(allsubsbj, allact)
	#write.table(allsubsbjact, file="./output/allsubsbjact.txt", sep=" ", row.name=FALSE)
	
	#4. Appropriately labeling the data set with descriptive variable names. 
	print("Start Appropriately labeling the data set with descriptive variable names...")
	subftclear = subft
	subftclear$ftName <- gsub("-", "", subftclear$ftName)
	subftclear$ftName <- gsub("\\(", "", subftclear$ftName)
	subftclear$ftName <- gsub("\\)", "", subftclear$ftName)
	subftclear$ftName <- gsub("\\,", "", subftclear$ftName)
	subftclear$ftName <- gsub("std", "Std", subftclear$ftName)
	subftclear$ftName <- gsub("mean", "Mean", subftclear$ftName)
	names(allsubsbjact) = c(subftclear$ftName, "Subject", "Activity")
	#write.table(allsubsbjact, file="./output/allsubsbjactnamed.txt", sep=" ", row.name=FALSE)
	
	#5. From the data set in step 4, creates a second, independent tidy data set with 
	#	the average of each variable for each activity and each subject.
	print("Start creating the data set with the average of each variable for each activity and each subject...")
	library(dplyr)
	#by_abjact <- group_by(allsubsbjact, Subject, Activity)
	#testAvg <- summarise(by_abjact, avg1 = mean(tBodyAccMeanX, na.rm = TRUE))
	sum = allsubsbjact %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
	write.table(sum, file="./output/avgOfActSubject.txt", sep=" ", row.name=FALSE)

}
