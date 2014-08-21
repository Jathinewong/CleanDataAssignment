CleanDataAssignment
===================
Data Scientist- Getting and Cleaning Data Assignment

Introduction 
============
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Original Dataset
================
The dataset was downloaded from UCI - Human Activity Recognition Using Smartphone Dataset

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Set Information
====================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Program Discription
===================
Name : run_analysis.R

Instruction:

1.	Merges the training and the test sets to create one measurement data set.
2.	Merges the training activity and test activity sets to create one activity data set.
3.	Update the activity code in the activity data set to activity labels.
4.	Merges the training subject and test subject sets to create one subject data set.
5.	Extracts only the measurements on the mean and standard deviation column name for each measurement.
6.	Extracts only the measurements on the mean and standard deviation for each measurement.
7.	Combine the subject, activity and measurement of mean and standard deviation data to create subject_activity_mean_std data set
8.	Loop through the subject_activity_mean_std to extract mean and standard deviation to form a matrix.
9.	Use aggregate function to compute the average of each mean and each standard deviation for each subject and each activity.
10.	Write the above aggregate to a file, subject_activity_average.


