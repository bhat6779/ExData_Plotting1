data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

data1$datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")

data1$datetime <- as.POSIXct(data1$datetime)
par(mfrow = c(2, 2))

plot(data1$Global_active_power ~ data1$datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(data1$Voltage ~ data1$datetime, type = "l", ylab="Voltage", xlab="")
plot(data1$Sub_metering_1 ~ data1$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data1$Sub_metering_2 ~ data1$datetime, col = "Red")
lines(data1$Sub_metering_3 ~ data1$datetime, col = "Blue")
legend("topright", lty = 1, pch=1, cex=0.5, pt.cex = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(data1$Global_reactive_power ~ data1$datetime, type = "l", ylab="Global reactive power", xlab="")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
