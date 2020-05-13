---
title: "Codebook.md"
author: "Jordan Barrows"
date: "May 12, 2020"
output: html_document
---

## Project Objective
***
The objective of this project is to tidy up a data set.

## Data Introduction
***
* This script uses six data files (x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt) from the **UCI HAR Dataset**, which was 
downloaded from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
* activity_labels.txt contains the names of the activities and corresponding numbers
* features.txt contains all of the feature names in the raw data sets
* features_info.text contains descriptions of the features.

## Script Description
***
The code performs the following steps:

1. Initializes the "dplyr" and "reshape2" libraries. 
2. Checks to see if the data has already been downloaded. If not, it downloads and unzips it. 
3. Imports activity and feature names and curates feature names to be more descriptive.
4. Loads train and test data sets and creates tables for each including subject numbers, activity names, and only columns corresponding to feautures for which the standard deviation or mean was measured.
5. Combines train and test tables and re-labels activities with activity names.
6. Melts and recasts the combined data table in terms of means of each feature for each Subject + Activity pair.
7. Writes the resulting file to a new file called "tidydata.txt".

## Output Description
***
"tidydata.txt" includes the following variables, calculated as means of measurements for all values per Subject + Activity pair, sorted by Subject + Activity pairs:

#### Variable List

 [1] "Subject"                                                      
 [2] "Activity"                                                     
 [3] "TimedomainBodyAccelerometerMeanX"                             
 [4] "TimedomainBodyAccelerometerMeanY"                             
 [5] "TimedomainBodyAccelerometerMeanZ"                             
 [6] "TimedomainBodyAccelerometerSTimedomaindX"                     
 [7] "TimedomainBodyAccelerometerSTimedomaindY"                     
 [8] "TimedomainBodyAccelerometerSTimedomaindZ"                     
 [9] "TimedomainGraviTimedomainyAccelerometerMeanX"                 
[10] "TimedomainGraviTimedomainyAccelerometerMeanY"                 
[11] "TimedomainGraviTimedomainyAccelerometerMeanZ"                 
[12] "TimedomainGraviTimedomainyAccelerometerSTimedomaindX"         
[13] "TimedomainGraviTimedomainyAccelerometerSTimedomaindY"         
[14] "TimedomainGraviTimedomainyAccelerometerSTimedomaindZ"         
[15] "TimedomainBodyAccelerometerJerkMeanX"                         
[16] "TimedomainBodyAccelerometerJerkMeanY"                         
[17] "TimedomainBodyAccelerometerJerkMeanZ"                         
[18] "TimedomainBodyAccelerometerJerkSTimedomaindX"                 
[19] "TimedomainBodyAccelerometerJerkSTimedomaindY"                 
[20] "TimedomainBodyAccelerometerJerkSTimedomaindZ"                 
[21] "TimedomainBodyGyroscopeMeanX"                                 
[22] "TimedomainBodyGyroscopeMeanY"                                 
[23] "TimedomainBodyGyroscopeMeanZ"                                 
[24] "TimedomainBodyGyroscopeSTimedomaindX"                         
[25] "TimedomainBodyGyroscopeSTimedomaindY"                         
[26] "TimedomainBodyGyroscopeSTimedomaindZ"                         
[27] "TimedomainBodyGyroscopeJerkMeanX"                             
[28] "TimedomainBodyGyroscopeJerkMeanY"                             
[29] "TimedomainBodyGyroscopeJerkMeanZ"                             
[30] "TimedomainBodyGyroscopeJerkSTimedomaindX"                     
[31] "TimedomainBodyGyroscopeJerkSTimedomaindY"                     
[32] "TimedomainBodyGyroscopeJerkSTimedomaindZ"                     
[33] "TimedomainBodyAccelerometerMagnitudeMean"                     
[34] "TimedomainBodyAccelerometerMagnitudeSTimedomaind"             
[35] "TimedomainGraviTimedomainyAccelerometerMagnitudeMean"         
[36] "TimedomainGraviTimedomainyAccelerometerMagnitudeSTimedomaind"

[37] "TimedomainBodyAccelerometerJerkMagnitudeMean"                 
[38] "TimedomainBodyAccelerometerJerkMagnitudeSTimedomaind"         
[39] "TimedomainBodyGyroscopeMagnitudeMean"                         
[40] "TimedomainBodyGyroscopeMagnitudeSTimedomaind"                 
[41] "TimedomainBodyGyroscopeJerkMagnitudeMean"                     
[42] "TimedomainBodyGyroscopeJerkMagnitudeSTimedomaind"             
[43] "FrequencydomainBodyAccelerometerMeanX"                        
[44] "FrequencydomainBodyAccelerometerMeanY"                        
[45] "FrequencydomainBodyAccelerometerMeanZ"                        
[46] "FrequencydomainBodyAccelerometerSTimedomaindX"                
[47] "FrequencydomainBodyAccelerometerSTimedomaindY"                
[48] "FrequencydomainBodyAccelerometerSTimedomaindZ"                
[49] "FrequencydomainBodyAccelerometerMeaneqX"                      
[50] "FrequencydomainBodyAccelerometerMeaneqY"                      
[51] "FrequencydomainBodyAccelerometerMeaneqZ"                      
[52] "FrequencydomainBodyAccelerometerJerkMeanX"                    
[53] "FrequencydomainBodyAccelerometerJerkMeanY"                    
[54] "FrequencydomainBodyAccelerometerJerkMeanZ"                    
[55] "FrequencydomainBodyAccelerometerJerkSTimedomaindX"            
[56] "FrequencydomainBodyAccelerometerJerkSTimedomaindY"            
[57] "FrequencydomainBodyAccelerometerJerkSTimedomaindZ"            
[58] "FrequencydomainBodyAccelerometerJerkMeaneqX"                  
[59] "FrequencydomainBodyAccelerometerJerkMeaneqY"                  
[60] "FrequencydomainBodyAccelerometerJerkMeaneqZ"                  
[61] "FrequencydomainBodyGyroscopeMeanX"                            
[62] "FrequencydomainBodyGyroscopeMeanY"                            
[63] "FrequencydomainBodyGyroscopeMeanZ"                            
[64] "FrequencydomainBodyGyroscopeSTimedomaindX"                    
[65] "FrequencydomainBodyGyroscopeSTimedomaindY"                    
[66] "FrequencydomainBodyGyroscopeSTimedomaindZ"                    
[67] "FrequencydomainBodyGyroscopeMeaneqX"                          
[68] "FrequencydomainBodyGyroscopeMeaneqY"                          
[69] "FrequencydomainBodyGyroscopeMeaneqZ"                          
[70] "FrequencydomainBodyAccelerometerMagnitudeMean"                
[71] "FrequencydomainBodyAccelerometerMagnitudeSTimedomaind"        
[72] "FrequencydomainBodyAccelerometerMagnitudeMeaneq"              
[73] "FrequencydomainBodyBodyAccelerometerJerkMagnitudeMean"        
[74] "FrequencydomainBodyBodyAccelerometerJerkMagnitudeSTimedomaind"
[75] "FrequencydomainBodyBodyAccelerometerJerkMagnitudeMeaneq"      
[76] "FrequencydomainBodyBodyGyroscopeMagnitudeMean"                
[77] "FrequencydomainBodyBodyGyroscopeMagnitudeSTimedomaind"        
[78] "FrequencydomainBodyBodyGyroscopeMagnitudeMeaneq"              
[79] "FrequencydomainBodyBodyGyroscopeJerkMagnitudeMean"            
[80] "FrequencydomainBodyBodyGyroscopeJerkMagnitudeSTimedomaind"    
[81] "FrequencydomainBodyBodyGyroscopeJerkMagnitudeMeaneq" 

#### Identifiers

**Subject**: Identification number representing the subject
**Activity**: Type of activity subject performed

#### Measurements
The following measurements were converted to the indicated names in the final data set:

* Acc: Accelerometer *(standard gravity units 'g')*
* Gyro: Gyroscope *(radians/second)*
* Mag: Magnitude
* Prefix 't': Timedomain
* Prefix 'f': Frequencydomain

#### Activity Labels

The activity labels with the numbers they correspond to in the raw data sets:

Activity Number  | Activity Label
---------------- | ------------------
1                | WALKING
2                | WALKING_UPSTAIRS
3                | WALKING_DOWNSTAIRS
4                | SITTING
5                | STANDING
6                | LAYING

#### Author

Jordan Barrows
