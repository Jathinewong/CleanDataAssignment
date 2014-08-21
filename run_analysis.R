## Date: August 18 2014
## run_analysis: This function read in datasets, extract the required columns and return the aggregate average of each of the column.
## read_data: This function read in 2 datasets and rbind them.
##
## run_analysis: This function read in datasets, extract the required columns and return the aggregate average of each of the column 

run_analysis <- function() {
			
			features=read.table("UCI HAR Dataset/features.txt", stringsAsFactor=FALSE)
			
			measurement = read_data("UCI HAR Dataset/train/X_train.txt", 
									"UCI HAR Dataset/test/X_test.txt", 
									features$V2)
									
			subject = read_data("UCI HAR Dataset/train/Subject_train.txt", 
								"UCI HAR Dataset/test/subject_test.txt", 
								"subject")
								
			activity = read_data("UCI HAR Dataset/train/Y_train.txt", 
								"UCI HAR Dataset/test/Y_test.txt", 
								"activity")
			
			## update activity codes to activity labels
			activity = lapply(activity, factor, 
								labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
										"SITTING", "STANDING", "LAYING"))
			
			## extract the column names of the mean and standard deviation columns from the measurement
			vector_mean = grep("mean\\(\\)", features$V2)
			vector_std = grep("std\\(\\)", features$V2)
			vector_mean_std = c(vector_mean, vector_std)
			names_mean_std = names(measurement)[vector_mean_std]
			
			attach(measurement)
			attach(subject)
			attach(activity)
			
			## extract the mean and standard deviation from the measurement data.frame
			measurement_mean_std = subset(measurement, select=names_mean_std)
			
			## combine the subject, activity and measurement of the mean and std 
			subject_activity_mean_std = cbind(subject, activity, measurement_mean_std)
			
			## aggregate of the average of each mean and std for each subject and each activity
			subject_activity_average = 	aggregate(as.matrix(subject_activity_mean_std[,3:68]) ~ 
										subject + activity, data=subject_activity_mean_std, mean)
										
			attach(subject_activity_average)
										
			write.table(subject_activity_average, "./subject_activity_average.txt", 
						row.name=FALSE, quote=FALSE)
						
			print("Wrote subject_activity_average file to current directory")
			
}

## read_data: This function read in two files and combine them by rows 
read_data <- function(file_str1, file_str2, column_name) {
			
			file1 = read.table(file_str1)
			file2 = read.table(file_str2)
			combine_files = rbind(file1, file2)
			
			## set column names
			colnames(combine_files) = column_name
			
			return(combine_files)			
}