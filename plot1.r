# Read the data
data <- read.table("household_power_consumption.txt", sep =";", header = T, 
                   stringsAsFactors = F, na.strings = "?")

# Subset the data and change date format
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")

# Make and save the plot
png(filename="plot1.png", height = 480, width = 480)

hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

dev.off()
