# Course Project for Getting and Cleaning Data

The script "run_analysis.R" read data files from the downloaded txt files and stores the data as data.frame. 

Activity labels (1 to 6) were converted to actual discription of the activities. Columns were labeled accordingly based on description of the dataset.

Train and test datasets were process separately, then merged by `rbind`. 

The order of the columns were sorted alphabetically, except that "subject" is rearranged to be the first column. 

To create a tidy dataset for step five, the script loop through the table by subject, then by activity. The average of the numbers per subject and activity, is calculated with `colMeans`, which generate a list of numbers. This list of numbers is converted to a data.frame. This data.frame has only one column, so it is transposed to match existing data structure. 
