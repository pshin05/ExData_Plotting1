# Read data
Data <- read.csv('household_power_consumption.txt',
  header=T, 
  na.strings = "?",
  sep=";")

# Only need subset from 2007-02-01 to 2007-02-02)
Data2 <- subset(Data,
    Data$Date == '1/2/2007' | Data$Date == '2/2/2007')

# Plot1
hist(Data2$Global_active_power, 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png, 'plot1.png')
dev.off()
