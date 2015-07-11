plot4 <- function() {
  #read file into data frame with date and time as character types, other fields as
  #numbers, and "?"s treated as NAs.
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", colClasses=c("character","character",rep("numeric",7)))
  #create subset of dataframe for February 1 and 2, 2007
  small <- subset(data[data$Date == "1/2/2007" | data$Date == "2/2/2007",])
  small$Date_time <- strptime(paste(small$Date, small$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  #export png with 480x480 resolution
  png("plot4.png", width=480, height=480, type="cairo")
  #make it so charts are in a 2x2 grid
  par(mfrow=c(2,2))
  #create first chart
  plot(small$Date_time,small$Global_active_power,type="l", xlab="", 
       ylab="Global Active Power")
  #create second chart
  plot(small$Date_time,small$Voltage,type="l", xlab="datetime", ylab="Voltage")
  #create third chart
  plot(small$Date_time,small$Sub_metering_1,type="l", xlab="", 
       ylab="Energy sub metering", col="black")
  #add on to third chart with different colored lines
  lines(small$Date_time,small$Sub_metering_2,col="red",type="l")
  lines(small$Date_time,small$Sub_metering_3,col="blue",type="l")
  #add legend to third chart
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1), col=c("black","red","blue"), bty="n")
  #create fourth chart
  plot(small$Date_time,small$Global_reactive_power,type="l", xlab="datetime", 
       ylab="Global_reactive_power")
  #close png
  dev.off()
}