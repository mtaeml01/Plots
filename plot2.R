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
png(filename = "plot2.png", width = 480, height = 480)

# Create the plot and save it to the png device
plot(power_sub$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

# Close the png device
dev.off()