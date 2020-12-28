Analysis/Tidying
=================

run_analysis.R carries out the following steps:

1. Downloads the data
2. Imports the test and training datasets, adds column names and assigns activity and subject codes
3. Merges test and train data into a single dataset
4. Removes variables, leaving only activity code, subject code and mean and standard deviation for each measurement
5. Replaces activity codes with descriptive names

= At this point data.txt is created =

6. Averages measurements by each subject/activity

= At this point avdata.txt is created =


Features
=================

The resulting dataset has the following features:  
'{xyz}' is used to denote 3-axial signals in the X, Y and Z directions.

tbodyacc{xyz}

tgravityacc{xyz}

tbodyaccJerk{xyz}

tbodygyro{xyz}

tbodygyrojerk{xyz}

tbodyaccmag

tgravityaccmag

tbodyaccjerkmag

tbodygyromag

tbodygyrojerkmag

fbodyacc-XYZ

fbodyaccjerk-XYZ

fbodygyro-XYZ

fbodyaccmag

fbodyaccjerkmag

fbodygyromag

fbodygyrojerkmag


The set of variables that were estimated from these signals are: 

mean: Mean value

std: Standard deviation
