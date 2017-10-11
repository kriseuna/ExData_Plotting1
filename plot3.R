## get data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## plot in png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## clean data
rm(data)