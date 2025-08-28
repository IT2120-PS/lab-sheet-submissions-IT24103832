##Setting te directory
setwd("C:/Users/User/Desktop/IT24103832")
##Importing the data set
data<-read.table("Data.txt",header=TRUE,sep = ",")
##View the file in a separate window
fix(data)
#Close the data window before you run the rest of the commands.
#Unless rest of the commands won't run.

##Attach the file into R.So, you can call the variables by their names.
attach(data)

##Part 1
##Rename the variables (column headings) of the data set as X1 and X2
names(data)<-c("X1","X2")

##Attach the file into R again as we renamed the variables.
attach(data)

##Obtain histogram for number of shareholders
hist(X2,main="Histogram for Number of Shareholders")

##Part 2
##Using "breaks" command we can define number of classes we need in the histogram 
##along with lower limit and upper limit.
##Using "right" command we can define whether classes have closed intervals or open intervals.
histogram<-hist(X2,main="Histogram for Number of Shareholders",breaks = seq(130,270,length = 8),right = FALSE)

##Check how each argument inside "hist" command works using "help" command as follows
?hist

##Part 3
##Assign class limits of the frequency distribution into a variable called "breaks"
breaks <- round(histogram$breaks)
##Assign class frequencies of the histogram into a variable called "freq"
freq <- histogram$counts
##Assign mid point of each class into a variable called "mids"
mids <- histogram$mids

##Creating the variable called "Classes" for the frequency distribution
classes <- c()

##Creating a "for" loop to assign classes of the frequency distribution into "Classes" variable created above.
for(i in 1:length(breaks)-1){
  classes[i] <- paste0("[",breaks[i], ",",breaks[i+1], ")")
}

##Obtaining frequency distribution by combining the values of "Classes" & "freq" variables
##"cbind" command used to merge the columns with same length
cbind(Classes = classes, Frequency = freq)

##Pat 4
##Draw frequency polygon to the same plot.
lines(mids, freq)

##Draw frequency polygon in a new plot.
plot(mids, freq, type = "1", main = "Frequency Polygon for Shareholders",xlab = "Shareholders", ylab = "Frequency",ylim = c(0,max(freq)))

##Part 5
##Using "cumsum" command we can get cumulative frequencies
cum.freq <- cumsum(freq)

##Creating a null variable called "new"
new<-c()
##Using "for" loop to store cumulative frequencies in order to get the ogive
for(i in 1:length(breaks)){
  if(i==1){
    new[i]=0
  }else{
    new[i]=cum.freq[i-1]
  }
}

##Draw cumulative frequency polygon in a new plot
plot(breaks, new, type = 'l', main = "Cumulative Frequency Polygon for Shareholders",
     xlab = "Shareholders", ylab = "Cumulative Frequency", ylim = c(0,max(cum.freq)))
##Obtain upper limit of each class along with its cumulative frequency in a table
cbind(Upper = breaks, CumFreq = new)

#Exercise

# Set working directory 
setwd("C:/Users/User/Desktop/IT24103832")

# 1. Import the dataset and store it in a data frame called "Delivery_Times"
Delivery_Times <- read.table("Exercise - Lab 05.txt", header = TRUE, sep = ",")

# View the data structure
str(Delivery_Times)
head(Delivery_Times)

# Attach the data frame to access variables directly
attach(Delivery_Times)

# Rename the column for easier access (assuming the column is named appropriately)
names(Delivery_Times) <- c("Delivery_Time")

# Re-attach after renaming
attach(Delivery_Times)

# 2. Draw histogram with nine class intervals (20-70), right open intervals
histogram <- hist(Delivery_Time, 
                  main = "Histogram of Delivery Times",
                  xlab = "Delivery Time",
                  breaks = seq(20, 70, length = 10),
                  right = FALSE,
                  col = "lightblue",
                  border = "black")

# 3. Comment on the shape of the distribution
# The distribution appears to be [shape will be determined after viewing the histogram]
# Possible shapes: symmetric, right-skewed, left-skewed, bimodal, uniform

# 4. Draw cumulative frequency polygon (ogive) in a separate plot
# First, get the breaks and frequencies from the histogram
breaks <- round(histogram$breaks)
freq <- histogram$counts
mids <- histogram$mids

# Calculate cumulative frequencies
cum_freq <- cumsum(freq)

# Create cumulative frequency data for ogive
ogive_breaks <- breaks
ogive_cum_freq <- c(0, cum_freq)  # Start with 0 cumulative frequency

# Create the ogive plot
plot(ogive_breaks, ogive_cum_freq, 
     type = "l", 
     main = "Cumulative Frequency Polygon (Ogive) for Delivery Times",
     xlab = "Delivery Time", 
     ylab = "Cumulative Frequency",
     ylim = c(0, max(ogive_cum_freq)),
     col = "blue",
     lwd = 2)

# Add points to the ogive
points(ogive_breaks, ogive_cum_freq, pch = 16, col = "red")

# Add grid for better readability
grid()

# Display cumulative frequency table
cumulative_table <- data.frame(Upper_Limit = ogive_breaks, Cumulative_Frequency = ogive_cum_freq)
print("Cumulative Frequency Table:")
print(cumulative_table)

# Detach the data frame
detach(Delivery_Times)
