setwd("C:/Users/User/Desktop/IT24103832")
getwd()

#random sample of size 25 for the baking time
sample <- rnorm(25, mean =45, sd =2)

# Test whether the average baking time is less than 46 minutes at a 5% level of significance.
t.test (sample, mu=46, alternative = "less")
