# Read data
Data <- read.csv('household_power_consumption.txt',
                 header=T, 
                 na.strings = "?",
                 sep=";")

# Only need subset from 2007-02-01 to 2007-02-02)
Data2 <- subset(Data,
                Data$Date == '1/2/2007' | Data$Date == '2/2/2007')

# Plot3
DateTime <- strptime(paste(Data2$Date, Data2$Time),
                     format="%d/%m/%Y %H:%M:%S")

with(Data2, {
  plot(DateTime, Sub_metering_1, col="black", type='l',
       main="", xlab="", ylab="Energy sub metering")
  points(DateTime, Sub_metering_2, col="red", type="l")
  points(DateTime, Sub_metering_3, col="blue", type="l")
  legend('topright', lty=c(1,1,1), col=c('black','red','blue'), 
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
})

dev.copy(png, 'plot3.png')
dev.off()
