plot2 <- function(){
    data <- read.table("./household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Time <- strptime(data$Time, format = "%H:%M:%S")
    subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
    png(filename = "plot2.png")
    plot(subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt='n')
    axis(1, at = c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
    dev.off()
}
