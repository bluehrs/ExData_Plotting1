plot2 <- function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", colClasses=c("character","character",rep("numeric",7)))
  small <- subset(data[data$Date == "1/2/2007" | data$Date == "2/2/2007",])
  small$Date_time <- strptime(paste(small$Date, small$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  png("plot2.png", width=480, height=480, type="cairo")
  plot(small$Date_time,small$Global_active_power,type="l", xlab="", 
       ylab="Global Active Power (kilowatts)")
  dev.off()
}