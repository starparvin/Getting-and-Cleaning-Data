# Getting-and-Cleaning-Data
This is created for the Getting and Cleaning Data Course on Coursera Website
## How to run the script
* Here are the data for the project: Please Download the data from the link below.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* unzip the data into a folder
* Download the script: run_analysis.R  from this repository
* Change working directory of R to the folder holding both data and the script.
* To run the script type:  > source("run_analysis.R") 
* Alternatively you can run the script from command line: $Rscript run_analysis.R

## Output
The Script will read the data, transform it and clean it according to the requirments and Write the clean data into a file named: "tidy_clean_data.txt". This file contain the average measurements for each Subject and Activity. This data containes 180 rows and 68 columns. 




