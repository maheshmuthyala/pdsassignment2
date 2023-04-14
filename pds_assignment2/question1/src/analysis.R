library(tidyverse)
library(boot)
###reading file
data=read.csv("C:/Users/DELL/Desktop/pds_assignment2/question1/data_clean/diabetes.csv")
###setting seed
set.seed(101)
library(dplyr, warn.conflicts = FALSE)
###slicing
sf_25=slice_sample(data,n=25)
sample_mean = mean(sf_25$Glucose)
sample_max = max(sf_25$Glucose)
pop_mean = mean(data$Glucose)
pop_max = max(data$Glucose)
###graph of sample data
hist(sf_25$Glucose, main = "Glucose in Sample data", xlab = "Glucose")
abline(v = sample_mean, col = "green", lwd = 4)
###graph of population data
hist(data$Glucose, main = "Glucose in Population data", xlab = "Glucose")
abline(v = pop_mean, col = "green", lwd = 4)
###comparison of mean
barplot(c(pop_mean,sample_mean),
+ names.arg = c("pop","sample"),
+ xlab = "Mean Comparison", ylab = "Glucose Mean")
###comparision of highest
barplot(c(pop_max,sample_max),
+ names.arg = c("pop","sample"),
+ xlab = "Max Comparison", ylab = "Glucose Max")

