data=read.csv("C:/Users/DELL/Desktop/pds_assignment2/question3/data_clean/diabetes.csv")

### Mean sd and percentile of blood pressure
pop_mean <- mean(data$BloodPressure)
pop_sd <- sd(data$BloodPressure)
pop_percentile <- quantile(data$BloodPressure, probs = c(0.25, 0.5, 0.75))

### Sampling
n_samples <- 500
sample_size <- 150
set.seed(101) 
samples <- lapply(1:n_samples, function(x) {
  sample(data$BloodPressure, size = sample_size, replace = TRUE)
})

sample_means <- sapply(samples, mean)
sample_sds <- sapply(samples, sd)
sample_percentiles <- t(sapply(samples, function(x) quantile(x, probs = c(0.25, 0.5, 0.75))))

library(ggplot2)
library(gridExtra)

### Graphs of blood pressure
pop_plot <- ggplot(data, aes(x = BloodPressure)) + 
  geom_histogram(aes(y = ..density..), binwidth = 2, color = "black", fill = "white") +
  geom_density(color = "red") + 
  ggtitle("BloodPressure in Population")

sample_plot <- ggplot(data.frame(mean = sample_means), aes(x = mean)) + 
  geom_histogram(aes(y = ..density..), binwidth = 2, color = "black", fill = "white") +
  geom_density(color = "blue") + 
  ggtitle("Average Means from Samples")

grid.arrange(pop_plot, sample_plot, ncol = 2)

#Compare the population statistics with the sample statistics
cat("Population Mean: ", pop_mean, "\n")
cat("Sample Mean: ", mean(sample_means), "\n\n")
cat("Population SD: ", pop_sd, "\n")
cat("Sample SD: ", mean(sample_sds), "\n\n")
cat("Population Percentiles: \n")
print(pop_percentile)
cat("\n")
cat("Sample Percentiles: \n")
print(apply(sample_percentiles, 2, mean))
