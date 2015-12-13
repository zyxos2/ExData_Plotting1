#load libs
library(dplyr)
#read data
data <- read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings = c("?"))
#leave only needed data
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#convert data to appropriate type
data <- mutate(data, DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
#plot data
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)")
#close device
dev.off();