##Setting the directory
setwd("C:\\Users\\User\\Desktop\\IT24103832")

##Question 01

#Uniform Distribution
#Here, random variable x follows a uniform distribution with a=0 and b=30.

#Part 1

punif(10,min = 0, max = 30, lower.tail = TRUE)

#Part 2

#P(X>20) = 1-P(X<=20)
#Then command will be as follows.
1-punif(20,min = 0, max = 30, lower.tail = TRUE)
#Here, when that argument is "FALSE", it means that P(X>20).
punif(20,min = 0, max = 30, lower.tail = FALSE)

##Question 02

#Exponential Distribution
#Here, random variable x has exponential distribution with lambda=0.5.

#Part 1

pexp(3,rate = 0.5, lower.tail = TRUE)

#Part 2

#P(X>4) = 1-P(X<=4)
#Then command will be as follows.
1-pexp(4,rate = 0.5, lower.tail = TRUE)
#Here, when that argument is "FALSE", it means that P(X>4).
pexp(4,rate = 0.5, lower.tail = FALSE)

#Part 3

#It asks to find P(2<X<4). This can find using "pexp" command as follows.
#P(2<x<4) = P(x<=4)-P(X<=2)
pexp(4,rate = 0.5, lower.tail = TRUE)-pexp(2,rate = 0.5,lower.tail = TRUE)

##Question 03

#Normal Distribution
#Here, random variable x has  normal distribution with mean=36.8 and standard deviation=0.4 

#Part 1

#It asks to find P(x>=37.9). Following command gives the cumulative
#P(X>=37.9) = 1-P(X<37.9)
#Then command will be as follows.
1-pnorm(37.9,mean = 36.8, sd=0.4, lower.tail = TRUE)

#Part 2

#It asks to find P(36.4<X<36.9).  This can find using "pnorm" command as follows.
#P(36.4<X<36.9) = P(X<=36.9)-P(X<=36.4)
#Then command will be as follows.
pnorm(36.9,mean = 36.8, sd=0.4, lower.tail = TRUE)-pnorm(36.4,mean = 36.8, sd=0.4, lower.tail = TRUE)

#Part 3

#Then, P(X<b) = 1.2% = 0.012
qnorm(0.012,mean = 36.8, sd=0.4, lower.tail = TRUE)

#Part 4

#Then, P(X>b) = 1.0 = 0.01
#Here, you need to make the "lower.tail" argument as FALSE.

qnorm(0.01,mean =36.8, sd=0.4, lower.tail = FALSE)

##Exercise

#Question 01
#P(10 < X < 25) = P(X <= 25) - P(X <= 10)
#Then command will be as follows.
punif(25, min = 0, max = 40, lower.tail = TRUE) - punif(10, min = 0, max = 40, lower.tail = TRUE)

#Question 02
#P(X <= 2)
#Then command will be as follows.
pexp(2, rate = 1/3, lower.tail = TRUE)

#Question 03
#Part 1

#P(X > 130) = 1 - P(X <= 130)
1 - pnorm(130, mean = 100, sd = 15, lower.tail = TRUE)
# Alternatively, using lower.tail = FALSE:
# pnorm(130, mean = 100, sd = 15, lower.tail = FALSE)

#Part 2

#Then, P(X <= b) = 0.95
qnorm(0.95, mean = 100, sd = 15, lower.tail = TRUE)