if(!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data.zip")
  unzip("data.zip")
}

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()