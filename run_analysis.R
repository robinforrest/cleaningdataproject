library(dplyr)

#######################
# Unzip and load data #
#######################

colnames <- read.table("UCI HAR Dataset/features.txt")[,2]

testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
names(testdata) <- colnames
testlabels <- read.table("UCI HAR Dataset/test/y_test.txt")
names(testlabels) <- "activitycode"
testdata <- cbind(testlabels,testdata)
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(testsubjects) <- "subjectcode"
testdata <- cbind(testsubjects,testdata)

traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
names(traindata) <- colnames
trainlabels <- read.table("UCI HAR Dataset/train/y_train.txt")
names(trainlabels) <- "activitycode"
traindata <- cbind(trainlabels,traindata)
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(trainsubjects) <- "subjectcode"
traindata <- cbind(trainsubjects,traindata)


#############################
# Merge test and train data #
#############################

data <- rbind(testdata,traindata)


#################################################################
# Extract only mean and standard deviation for each measurement #
#################################################################

data <- data[,grepl("mean\\(\\)|std\\(\\)|activitycode|subjectcode",names(data))]


#################################################
# Replace activity codes with descriptive names #
#################################################

activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activitylabels) <- c("activitycode","activityname")

data <- merge(activitylabels, data, by="activitycode", all.y=TRUE)
data <- subset(data, select = -activitycode)


#################################################
# Replace variable names with descriptive names #
#################################################

names(data) <- tolower(names(data))
names(data) <- gsub("-","",names(data))
names(data) <- gsub("\\(\\)","",names(data))

write.table(data, "data.txt", row.name=FALSE)

############################################################
# Create second data set with averages by activity+subject #
############################################################

avdata <- data %>%
  group_by(activityname, subjectcode) %>%
  summarise_all(mean)

write.table(avdata, "avdata.txt", row.name=FALSE)

