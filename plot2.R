## get data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")), ]

## plot in png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

## clean data
rm(data)