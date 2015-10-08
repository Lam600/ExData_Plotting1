# Read the data
data <- read.table("household_power_consumption.txt", sep =";", header = T, 
                   stringsAsFactors = F, na.strings = "?")

# Subset the data and change date format
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")

# Add variable with day and time
subset$Daytime <- as.POSIXct(paste(subset$Date, subset$Time, sep=" "))

# Make and save the plot
png(filename="plot3.png", height = 480, width = 480)

with(subset, {
  plot(Daytime, Sub_metering_1, type="l", xlab = "", 
       ylab = "Energy sub metering")
  lines(Daytime, Sub_metering_2, col = "red")
  lines(Daytime, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), lty = 1, lwd = 1,
         col = c("black","red", "blue"))
})

dev.off()

