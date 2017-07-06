# Read in the dataset
power = read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

# Check to see if it contains 2,075,259 rows and 9 columns
str(power)
summary(power)

# Convert the "Date" and "Time" columns to R date and time objects respectively
power$Date = as.Date(x = power$Date, format = "%d/%m/%Y")
power$Time = strptime(x = power$Time, format = "%H:%M:%S")

# Subset out only data from the dates 2007-02-01 and 2007-02-02
power_sub = subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# Open a png device
png(filename = "plot4.png")

# Create the plot and save it to the png device

# Change the number of plots that can be drawn on one screen
par(mfrow = c(2, 2))

plot(power_sub$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

plot(power_sub$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

plot(power_sub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", xaxt = "n")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
points(power_sub$Sub_metering_1, type = "s", col = "black")
points(power_sub$Sub_metering_2, type = "s", col = "red")
points(power_sub$Sub_metering_3, type = "s", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), pt.cex = 1, cex = 0.4, bty = "n")

plot(power_sub$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

# Close the png device
dev.off()