# Produce a Plot2, Global Active Power Consumption over time
# for "2007-02-01" and "2007-02-02".
plot2 <- function(){
    # Load the power consumption data into memory.
    data <- read.table("./household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

    # Add a new column to the data that combines date and time into a DateTime representation.
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

    # Subset the data to isolate only the first and second of February 2007.
    subset <- subset(data, data$DateTime >= "2007-02-01" & data$DateTime <= "2007-02-03")

    # Open the PNG stream.
    png(filename = "plot2.png")

    # Plot the Global Active POwer consumption over time.
    plot(subset$DateTime, subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

    # Close the PNG stream and write to the file.
    dev.off()
}
