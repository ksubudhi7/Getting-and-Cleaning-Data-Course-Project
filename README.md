# Getting-and-Cleaning-Data-Course-Project

Following Steps are performed -

1. download and unzip the data file.
2. save the R source code (run_analysis.R) into your R working directory and load the code in a new R session
3. Run R source code to generate tidy data file.

Data description  
The data is based on signals from the waist-mounted Samsung Galaxy S smartphones (through the accelerometers and gyroscopes) and aimed to study the gravitational force in different activities like walking, standing.  

New dataset  
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.  

Code description   
After loading the train and test data to R, they are merged to get the full data set  
Extracts only the measurements on the mean and standard deviation for each measurement  
The column names of the dataset are modified to give better meaning to the names  
The values(codes) in the activity column are replaced with actual activities.  
Create the final tidy dataset with average of variables for each activity and each subject.  

How different files are connected?  

The raw data is avaialble in the link provided in the assignment.  
The codebook (Codebook.md file) contains details on the data, variables and transformations that are conducted on the raw data to get the final output.  
The actual R code is given in run_analysis.R file. This code is written based on the instructions of the assignment.  
The final output is given as Second_Tidy_data.txt file.  
