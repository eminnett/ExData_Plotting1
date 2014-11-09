plot4 <- function(){
    data <- read.table("./household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Time <- strptime(data$Time, format = "%H:%M:%S")
    subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

    png(filename = "plot4.png")

    par(mfcol=c(2,2))

    plot(subset$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt='n')
    axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

    plot(subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt='n')
    lines(subset$Sub_metering_2,col="red")
    lines(subset$Sub_metering_3,col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1) , col = c("black", "red", "blue"), bty = "n")
    axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

    plot(subset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt='n')
    axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

    plot(subset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt='n')
    axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

    dev.off()
}
