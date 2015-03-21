
# course project script
# run_analysis.R
# Get the data.  it's in a zip file, so download contents
# from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Put the relevant files into a folder "C:/Desktop/data" in your working directory


## 1.Read the data files into R:

sub_test <- read.table("./subject_test.txt")
x_test <- read.table("./X_test.txt")
y_test <- read.table("./Y_test.txt")
sub_train <- read.table("./subject_train.txt")
x_train <- read.table("./X_train.txt")
y_train <- read.table("./Y_train.txt")
features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

## 2.Merge the train and the test data sets by rows
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
s <- rbind(sub_train, sub_test)


# Use descriptive names to features column
names(features) <- c('feat_id', 'feat_name')

# Get matches to argument mean or standard deviation within each element of character vector
index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
x <- x[, index_features] 

# Replaces all matches of a string features 
names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))


## 3. Use descriptive activity names to name the activities in the dataset
## 4. Use appropriate labels the data set with descriptive activity names

# Use descriptive names to activities column
names(activities) <- c('act_id', 'act_name')
y[, 1] = activities[y[, 1], 2]

names(y) <- "Activity"
names(s) <- "Subject"


#Create dataset 1
tidy_data1 <- cbind(s, y, x)

## 5. Create dataset 2, independent tidy data set with the average of each variable for each activity and each subject:
p <- tidy_data1[, 3:dim(tidy_data1)[2]] 
AVG_data <- aggregate(p,list(tidy_data1$Subject, tidy_data1$Activity), mean)

# Name columns Activity and Subject  
names(AVG_data)[1] <- "Subject"
names(AVG_data)[2] <- "Activity"

#Output results
write.table(tidy_data1, file = "tidy_data1.txt")
write.table(AVG_data,"tidy_data2.txt",row.name=FALSE) #to submit output
