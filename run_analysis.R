library(dplyr)
# Read X
xtrain<-read.table("train/X_train.txt")
xtest<-read.table("test/X_test.txt")
X<-rbind(xtrain,xtest)
rm(xtrain)
rm(xtest)
# Read Y
ytrain<-read.table("train/y_train.txt")
ytest<-read.table("test/y_test.txt")
Y<-rbind(ytrain,ytest)
rm(ytrain)
rm(ytest)
# Read Subject
strain<-read.table("train/subject_train.txt")
stest<-read.table("test/subject_test.txt")
S<-rbind(strain,stest)
rm(strain)
rm(stest)
# Read features
features <- read.table("features.txt")
# Extract mean and std measurements
indices <- features[grepl("-mean\\(\\)|-std\\(\\)", features[,2]),1]
# select desired feasures
X<-select(X,indices)
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))

# Read Activity Labels
activities <- read.table("activity_labels.txt")

# Use descriptive variable names for activities
Y[,1] = activities[Y[,1], 2]
names(Y) <- "Activity"
names(S) <- "Subject"

#Attach the measuerments to their respective activity and subject
data_all <- cbind(X,Y,S)

# summarise variables by subject and activity
cleaned <- group_by(data_all, Activity, Subject) %>% summarise_each(funs(mean))

# write the clean data into the file
write.table(cleaned,"tidy_clean_data.txt", row.name=FALSE) 
