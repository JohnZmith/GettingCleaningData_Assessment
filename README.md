# Getting and Cleaning Data - Course Project - README

## Where are the raw data from?

The raw data was collected from the accelerometers from the Samsung Galaxy S
smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A link to the data is given here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



## How does the script *run_analysis.R* work?

The Script run_analysis.R downloads the raw data from the above link 
and unzips its folder and loads and merges the following into one data set called
named.data.

- the various activity data (from both train and test set), which creates a
        10299 x 561 - matrix, 
- the IDs of the 30 subjects (from both train and test set), whose activity was measured,
- the labels of the 6 activities (walking, walking upstairs, walking downstairs, 
        sitting, standing, laying) the person was doing while measured,
- the abbreviated codes for the 561 measured variables 
        (like accelertion in x-, y-, z-direction etc, see CodeBook.md)

The data set was then reduced to only 66 variables which are means or 
standard deviation of the measurements and their labels were simplified to 
decriptive names. Together with the "Activity"-label and "Subject"-ID the 
data frame *named.data* is then of size 
        10299 x 68.

Furthermore, the data of each measurement was then averaged for each of the
30 subjects and each of the 6 activities and written into a 
        180 x 68 - matrix
called *tidy.data*, which also was written into the text file: 
        "tidy_mean_activity_data.txt" [219KB].


## What does all the variables mean?

Please see "CodeBook.md" and the readme of the downloaded folder.
