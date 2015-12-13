#load libs
library(dplyr)
#read data
data <- read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings = c("?"))
#leave only needed data
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#convert data to appropriate type
data <- mutate(data, DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
#plot data
png(filename = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, typ = "n", ylab = "Energy sub metering", xlab = "")
lines(xy.coords(data$DateTime, data$Sub_metering_1), col="black")
lines(xy.coords(data$DateTime, data$Sub_metering_2), col="red")
lines(xy.coords(data$DateTime, data$Sub_metering_3), col="blue")
legend("topright", lwd=c(2.5, 2.5), col = c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#close device
dev.off();