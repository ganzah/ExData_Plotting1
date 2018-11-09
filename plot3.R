if(!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip")
  unzip("data.zip")
}

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
data$DateAndTime <- strptime(paste(data$Date, data$Time, sep = " - "), format = "%d/%m/%Y - %H:%M:%S")
Sys.setlocale("LC_ALL", "English")
plot(data$DateAndTime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data$DateAndTime, data$Sub_metering_1, col = "black")
lines(data$DateAndTime, data$Sub_metering_2, col = "red")
lines(data$DateAndTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
Sys.setlocale("LC_ALL", "")
dev.off()