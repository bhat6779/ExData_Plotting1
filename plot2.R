data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

data1$datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
data1$datetime <- as.POSIXct(data1$datetime)
plot(data1$Global_active_power ~ data1$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
