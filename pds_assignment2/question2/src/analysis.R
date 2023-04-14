### Reading data
data=read.csv("C:/Users/DELL/Desktop/pds_assignment2/question2/data_clean/diabetes.csv")
### setting seed
set.seed(101)
library(dplyr, warn.conflicts = FALSE)
sf_25=slice_sample(data,n=25)

### calculating BMI 98th quantile
sample_bmi = quantile(sf_25$BMI, 0.98)
pop_bmi = quantile(data$BMI, 0.98)

###Comparison of BMI in population and sample
barplot(c(pop_bmi,sample_bmi),
+ names.arg = c("pop","sample"),
+ xlab = "Diabetes", ylab = "98th Percentile of BMI")

###BMI of population
hist(data$BMI, main="BMI of Population", xlab="BMI")
abline(v=pop_bmi, col="green", lwd = 4)

###BMI of sample
hist(sf_25$BMI, main="BMI of sample", xlab="BMI")
abline(v=sample_bmi, col="green", lwd = 4)