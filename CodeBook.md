### Data

The data set is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data processed to generate the final data set include:

- Dataset/train/X_train.txt: The measurements of training set.
- Dataset/test/X_test.txt: The measurements of test set.
- Dataset/features.txt: The features of trainging/test set.
- Dataset/train/subject_train.txt: The subject of training set.
- Dataset/test/subject_test.txt: The subject of test set.
- Dataset/train/Y_train.txt: The Activity of training set.
- Dataset/test/Y_test.txt: The Activity of test set.

The final data set contains 180 rows (30 subject each has 6 Activities) x 88 columns (columns related to mean and std extracts from original data set).

The value of each cell is the average of each variable for each activity and each subject of original UCI HAR Dataset.

---
### Transformations or work performed to clean up the data 
#### Step:

1. Merges the training and the test sets to create one data set.
 * Load the training and test data set by read.table. Merge the data sets by rbind.
 
2. Extracts only the measurements on the mean and standard deviation for each measurement.
 * Extract the Columns which the column name contains the string "Mean", "mean" or "Std"

3. Uses descriptive activity names to name the activities in the data set. 
 * Replace the code of activities (1,2..6) to human readable activity name like "WALKING", "STANDING"...etc.

4. Appropriately labels the data set with descriptive variable names. 
 * Remove the characters which often made progaam not able to further process or analysis like ",", "-", "(", ")".

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 * Use dplyr::summarize_each to group the measurements by Subject and Activity the calculate the means.

---
## Variables
#### the column name of the result data frame in order are: 
1. Subject
* Activity
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccMeanFreqX
* fBodyAccMeanFreqY
* fBodyAccMeanFreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccJerkMeanFreqX
* fBodyAccJerkMeanFreqY
* fBodyAccJerkMeanFreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMeanFreqX
* fBodyGyroMeanFreqY
* fBodyGyroMeanFreqZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccMagMeanFreq
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyAccJerkMagMeanFreq
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroMagMeanFreq
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
* fBodyBodyGyroJerkMagMeanFreq
* angletBodyAccMeangravity
* angletBodyAccJerkMeangravityMean
* angletBodyGyroMeangravityMean
* angletBodyGyroJerkMeangravityMean
* angleXgravityMean
* angleYgravityMean
* angleZgravityMean