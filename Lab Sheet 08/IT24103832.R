# Setting the directory
setwd("C:/Users/User/Desktop/IT24103832")

# Importing the data set
data<-read.table("Data - Lab 8.txt",header=TRUE)
fix(data)
attach(data)

## Question 01
# Command "mean" & "var" will compute the mean and variance for data.
popmn<-mean(Nicotine)
popvar<-var(Nicotine)

## Question 02
# First create null vectors to store sample data sets.
samples<-c()
n<-c()
# The "for" loop will be used to create and assign samples of size 5 for "samples" variable created above.
for(i in 1:30){
  s<-sample(Nicotine,5,replace=TRUE)
  samples<-cbind(samples,s)
  n<-c(n,paste('S' ,i))
}
# Assign column names for each sample created.Names have stored earlier under "n" variable.
colnames(samples)=n
# Using "apply" command we can ask to calculate any function such as mean,variance, etc.row wise or
# column wise in a matrix.
s.means<-apply(samples,2,mean)
s.vars<-apply(samples,2,var)

## Question 03
# Following command will calculate mean and variance of sample means stored in "s.means" variable.
samplemean<-mean(s.means)
samplevars<-var(s.means)

## Question 04
# Compare the population variance and variance of sample means.
truevar=popvar/5
samplevars

# Exercise
## Question 01
set.seed(123)  # for reproducibility
laptop_bags <- round(rnorm(40, mean = 2.5, sd = 0.3), 2)  # 40 bags, mean=2.5kg, sd=0.3kg

# Save as a text file (to mimic the given lab setup)
write.table(data.frame(Weight = laptop_bags), "Data - Lab 8.txt", row.names = FALSE)

# Load data
data <- read.table("Data - Lab 8.txt", header = TRUE)
attach(data)

# Population mean and standard deviation
pop_mean <- mean(Weight)
pop_sd <- sd(Weight)
pop_var <- var(Weight)

cat("Population Mean:", pop_mean, "\n")
cat("Population Standard Deviation:", pop_sd, "\n")

## Question 02
samples <- matrix(nrow = 6, ncol = 25)
sample_means <- numeric(25)
sample_sds <- numeric(25)

for (i in 1:25) {
  s <- sample(Weight, 6, replace = TRUE)
  samples[, i] <- s
  sample_means[i] <- mean(s)
  sample_sds[i] <- sd(s)
}

# Assign sample names
colnames(samples) <- paste("S", 1:25, sep = "")

# Create a data frame for the table
results <- data.frame(
  Sample = paste("S", 1:25),
  Mean = round(sample_means, 2),
  SD = round(sample_sds, 2)
)

print(results)

## Question 03
mean_of_means <- mean(sample_means)
sd_of_means <- sd(sample_means)

cat("Mean of Sample Means:", mean_of_means, "\n")
cat("Standard Deviation of Sample Means:", sd_of_means, "\n")

cat("Population Mean:", pop_mean, "\n")
cat("Mean of Sample Means:", mean_of_means, "\n")
cat("Population SD:", pop_sd, "\n")
cat("SD of Sample Means:", sd_of_means, "\n")
cat("Theoretical SE (pop_sd/sqrt(6)):", pop_sd / sqrt(6), "\n")

