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

* Then we need to merge the X,Y and Subject data frame by cbind function to connect them by column. The result is the data_all data frame 10299*68.
* The first 66 columns holds the measurements, 67th column holds the activity for those measurements, 68th column holds the Subject ID performing the activity.
* The script then group the data by subject and activity using group_by function.
* Using summarise_each function we can calculate the Average of each measurement per activity per subject.
* The result data frame contains 180 row (6 Activity * 30 subject) and 68 column. 
* First and second column tells the activity and the subject and the rest 66 columns are the average values.
* The script then write the clean data into the file called "tidy_clean_data.txt"
* 
