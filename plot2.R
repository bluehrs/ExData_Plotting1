plot2 <- function() {
  #read file into data frame with date and time as character types, other fields as
  #numbers, and "?"s treated as NAs.
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", colClasses=c("character","character",rep("numeric",7)))
  #create subset of dataframe for February 1 and 2, 2007
  small <- subset(data[data$Date == "1/2/2007" | data$Date == "2/2/2007",])
  small$Date_time <- strptime(paste(small$Date, small$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  #export png with 480x480 resolution
  png("plot2.png", width=480, height=480, type="cairo")
  #create line graph with appropriate labels
  plot(small$Date_time,small$Global_active_power,type="l", xlab="", 
       ylab="Global Active Power (kilowatts)")
  #close png
  dev.off()
}