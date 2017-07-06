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
png(filename = "plot3.png")

# Create the plot and save it to the png device
plot(power_sub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", xaxt = "n")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
points(power_sub$Sub_metering_1, type = "s", col = "black")
points(power_sub$Sub_metering_2, type = "s", col = "red")
points(power_sub$Sub_metering_3, type = "s", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), pt.cex = 1, cex = 0.7)

# Close the png device
dev.off()
