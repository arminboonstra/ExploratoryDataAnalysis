
# PART 1: This part of the code loads the data needed for the programming assingment. 
# To reproduce this you need to download the file, unzip it, and copy/move the text file to your working directory.
# The data can be found here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Imports the dataset
col_class <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
mydata <- read.csv("household_power_consumption.txt", header = TRUE,  colClasses = col_class, sep=";", na.strings="?")

# Keep only the data for the necessary dates
mydata <- mydata[mydata$Date=='1/2/2007' | mydata$Date=='2/2/2007',]

# Adds a new combined Data-Time column and convert it into a Data
mydata$DateTime <- paste(mydata$Date, mydata$Time) 
mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S" )

# PART 2: This part of the code constructs the data plot

# open device
png(filename='plot2.png', width=480, height = 480, units='px')

#plot data
plot(mydata$DateTime, mydata$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)', main = '')

#close device
dev.off()
