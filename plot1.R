## get data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")), ]

## draw hist in png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", breaks = 12, xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()

## clean data
rm(data)