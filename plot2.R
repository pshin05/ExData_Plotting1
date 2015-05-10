# Read data
Data <- read.csv('household_power_consumption.txt',
                 header=T, 
                 na.strings = "?",
                 sep=";")

# Only need subset from 2007-02-01 to 2007-02-02)
Data2 <- subset(Data,
                Data$Date == '1/2/2007' | Data$Date == '2/2/2007')

# Plot2
DateTime <- strptime(paste(Data2$Date, Data2$Time),
                     format="%d/%m/%Y %H:%M:%S")

plot(DateTime, 
     Data2$Global_active_power, 
     main="", xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")

dev.copy(png, 'plot2.png')
dev.off()
