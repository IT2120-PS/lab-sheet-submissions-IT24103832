setwd("C:/Users/User/Desktop/IT24103832")

##Question 01
#Part 2
#To conduct the test observed counts will be stored into a variable called "observed"
#And probabilities for each day will be stored into another variable called "prob"
observed <- c(120, 95, 85, 100)
prob <- c(0.25, 0.25, 0.25, 0.25)
#To conduct the test "chisq.test" command will be used as follows.
chisq.test(x=observed, p=prob)

