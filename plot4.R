## get data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## plot in png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")
## layout
par(mfrow = c(2,2))

## topleft
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## topright
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## bottomleft
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, bty = "n", cex = 0.9, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## bottomright
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

## clean data
rm(data)