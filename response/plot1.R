# Produce a Plot1, Global Active Power Freequency vs Consumption
# for "2007-02-01" and "2007-02-02".
plot1 <- function(){
    # Load the power consumption data into memory.
    data <- read.table("./household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

    # Add a new column to the data that combines date and time into a DateTime representation.
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

    # Subset the data to isolate only the first and second of February 2007.
    subset <- subset(data, data$DateTime >= "2007-02-01" & data$DateTime <= "2007-02-03")

    # Open the PNG stream.
    png(filename = "plot1.png")

    # Create a histogram of the Global Active Power Freequency vs Consumption
    hist(subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

    # Close the PNG stream and write to the file.
    dev.off()
}
