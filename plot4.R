# Read data
Data <- read.csv('household_power_consumption.txt',
                 header=T, 
                 na.strings = "?",
                 sep=";")

# Only need subset from 2007-02-01 to 2007-02-02)
Data2 <- subset(Data,
                Data$Date == '1/2/2007' | Data$Date == '2/2/2007')

# Plot4
DateTime <- strptime(paste(Data2$Date, Data2$Time),
                     format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
par(oma=c(0,0,0,0))
with(Data2, {
  plot(DateTime, 
       Data2$Global_active_power, 
       main="", xlab="",
       ylab="Global Active Power (kilowatts)",
       type="l")
  
  plot(DateTime, Voltage, type="l")
  
  plot(DateTime, Sub_metering_1, col="black", type='l',
       main="", xlab="", ylab="Energy sub metering")
  points(DateTime, Sub_metering_2, col="red", type="l")
  points(DateTime, Sub_metering_3, col="blue", type="l")
  legend('topright', lty=c(1,1,1), col=c('black','red','blue'), 
         box.lwd=0, cex=0.7,
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  
  plot(DateTime, Global_reactive_power, type="l")
})
par(mfrow=c(1,1))

dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()
