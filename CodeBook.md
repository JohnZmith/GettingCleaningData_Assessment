# Getting and Cleaning Data - Course Project - CodeBook


## SessionInfo when the script was build

R version 3.2.1 (2015-06-18)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 8 x64 (build 9200)

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] dplyr_0.4.2

loaded via a namespace (and not attached):
 [1] lazyeval_0.1.10 magrittr_1.5    R6_2.0.1        assertthat_0.1  htmltools_0.2.6 parallel_3.2.1  DBI_0.3.1      
 [8] tools_3.2.1     Rcpp_0.11.6     rmarkdown_0.7   digest_0.6.8 


## Where are the raw data from?

The raw data was collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A link to the data is given here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of the data and variables

30 subjects were measured during 6 activities
(walking, walking upstairs, walking downstairs, sitting, standing, laying).
The mean and standard deviation of features of the measurements 
(which included triaxial acceleration from the accelerometer
(total acceleration), the estimated body acceleration, triaxial Angular velocity
from the gyroscope; time and frequency domain variables)
were avageraged over for each subject and each activity.
Features were normalized and bounded within [-1,1].

The table with this averaged features is after running *run_analysis.R* then 
given in 
        "tidy_mean_activity_data.txt" [219KB].


## How does the script *run_analysis.R* transform the raw data?

The Script run_analysis.R downloads the raw data from the above link 
and unzips its folder and loads and merges the following into one data set called
named.data.

- the various activity data (from both train and test set), which creates a
        10299 x 561 - matrix, 
- the IDs of the 30 subjects (from both train and test set), whose activity was measured,
- the labels of the 6 activities
        (walking, walking upstairs, walking downstairs, sitting, standing, laying)
        the person was doing while measured,
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


