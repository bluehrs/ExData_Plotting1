plot3 <- function() {
  #read file into data frame with date and time as character types, other fields as
  #numbers, and "?"s treated as NAs.
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", colClasses=c("character","character",rep("numeric",7)))
  #create subset of dataframe for February 1 and 2, 2007
  small <- subset(data[data$Date == "1/2/2007" | data$Date == "2/2/2007",])
  small$Date_time <- strptime(paste(small$Date, small$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  #export png with 480x480 resolution
  png("plot3.png", width=480, height=480, type="cairo")
  #create chart and first line, as well as add appropriate labels
  plot(small$Date_time,small$Sub_metering_1,type="l", xlab="", 
       ylab="Energy sub metering", col="black")
  #add second line in red
  lines(small$Date_time,small$Sub_metering_2,col="red",type="l")
  #add third line in blue
  lines(small$Date_time,small$Sub_metering_3,col="blue",type="l")
  #add legend with appropriately colored lines
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1), col=c("black","red","blue"))
  #close png
  dev.off()
}