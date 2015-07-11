plot4 <- function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", colClasses=c("character","character",rep("numeric",7)))
  small <- subset(data[data$Date == "1/2/2007" | data$Date == "2/2/2007",])
  small$Date_time <- strptime(paste(small$Date, small$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  png("plot4.png", width=480, height=480, type="cairo")
  par(mfrow=c(2,2))
  plot(small$Date_time,small$Global_active_power,type="l", xlab="", 
       ylab="Global Active Power")
  plot(small$Date_time,small$Voltage,type="l", xlab="datetime", ylab="Voltage")
  plot(small$Date_time,small$Sub_metering_1,type="l", xlab="", 
       ylab="Energy sub metering", col="black")
  lines(small$Date_time,small$Sub_metering_2,col="red",type="l")
  lines(small$Date_time,small$Sub_metering_3,col="blue",type="l")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1), col=c("black","red","blue"), bty="n")
  plot(small$Date_time,small$Global_reactive_power,type="l", xlab="datetime", 
       ylab="Global_reactive_power")
  dev.off()
}