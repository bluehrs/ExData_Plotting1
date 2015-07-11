plot1 <- function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", colClasses=c("character","character",rep("numeric",7)))
  small <- subset(data[data$Date == "1/2/2007" | data$Date == "2/2/2007",])
  png("plot1.png", width=480, height=480, type="cairo")
  hist(small$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
       ylab="Frequency", main="Global Active Power")
  dev.off()
}