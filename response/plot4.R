plot4 <- function(){
    # Load the power consumption data into memory.
    data <- read.table("./household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

    # Add a new column to the data that combines date and time into a DateTime representation.
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

    # Subset the data to isolate only the first and second of February 2007.
    subset <- subset(data, data$DateTime >= "2007-02-01" & data$DateTime <= "2007-02-03")

    # Open the PNG stream.
    png(filename = "plot4.png")

    # Prepare the graphic to handle a grid of plots
    par(mfcol=c(2,2))

    # Plot the Global Active POwer consumption over time.
    plot(subset$DateTime, subset$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

    # Plot the Energy sub metering 1 over time.
    plot(subset$DateTime, subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    # Add the Energy sub metering 2 over time in red.
    lines(subset$DateTime, subset$Sub_metering_2,col="red")
    # Add the Energy sub metering 3 over time in blue.
    lines(subset$DateTime, subset$Sub_metering_3,col="blue")
    # Add a legend to the plot indicating the meaning of each line colour.
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1) , col = c("black", "red", "blue"), bty = "n")

    # Plot the Voltage over time.
    plot(subset$DateTime, subset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

    # Plot the Global Reactive Power over time.
    plot(subset$DateTime, subset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

    # Close the PNG stream and write to the file.
    dev.off()
}
