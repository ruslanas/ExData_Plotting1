source('load.R')
load('hpc.dat')

datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

png('plot2.png')
par(mar=c(3,5,2,2))
plot(datetime, hpc$Global_active_power, type='l',
     ylab='Global Active Power (kilowatts)')
dev.off()
