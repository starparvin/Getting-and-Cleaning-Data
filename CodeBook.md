Code Book
========================

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Cleaning tha data procedure:

* Read the X,Y and Subject files from both training and test folders and connecting the two by rbind function. 
* The X data frame contains 10299 observations and 561 attributes. 
* The Y and Subject data frames tells the Activity ID and subject performing the activity for each observation.
* The project requires to select the attributes that are mean or std of other measurements so we need to read "features.txt" to find out the column numbers of such attributes. Only 66 out of the 561 features matched. 
* We then select the desired columns of X data frame, found out in the previous step.
* Read the "activity_labels.txt" to find the mapping between the activities and their IDs. Use this information to change the Y data frame from ID to their descriptive values:

        walking
        
        walkingupstairs
        
        walkingdownstairs
        
        sitting
        
        standing
        
        laying

* The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed. Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are similar to the following:

        tbodyacc-mean-x 
        
        tbodyacc-mean-y 
        
        tbodyacc-mean-z 
        
        tbodyacc-std-x 
        
        tbodyacc-std-y 
        
        tbodyacc-std-z 
        
        tgravityacc-mean-x 
        
        tgravityacc-mean-y

* Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as data_set_with_the_averages.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names (see below), and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.
