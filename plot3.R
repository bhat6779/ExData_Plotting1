data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

data1$datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
data1$datetime <- as.POSIXct(data1$datetime)

plot(data1$Sub_metering_1 ~ data1$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data1$Sub_metering_2 ~ data1$datetime, col = "Red")
lines(data1$Sub_metering_3 ~ data1$datetime, col = "Blue")
legend("topright", lty = 1, cex=0.7, pt.cex = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
