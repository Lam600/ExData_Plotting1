# Read the data
data <- read.table("household_power_consumption.txt", sep =";", header = T, 
                   stringsAsFactors = F, na.strings = "?")

# Subset the data and change date format
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")

# Add variable with day and time
subset$Daytime <- as.POSIXct(paste(subset$Date, subset$Time, sep=" "))

# Make and save the plot
png(filename="plot2.png", height = 480, width = 480)

with(subset, {
  plot(Daytime, Global_active_power, type="l",
       xlab = "", ylab = "Global Active Power (kilowatts)")
})

dev.off()

