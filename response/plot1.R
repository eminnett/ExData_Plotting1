plot1 <- function(){
    data <- read.table("./household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Time <- strptime(data$Time, format = "%H:%M:%S")
    subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
    png(filename = "plot1.png")
    hist(subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
    dev.off()
}
