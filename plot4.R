source('load.R')
load('hpc.dat')

datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

png('plot4.png')

par(mfrow=c(2,2))

plot(datetime, hpc$Global_active_power, type='l',
     ylab='Global Active Power', xlab='')

plot(datetime, hpc$Voltage, type='l', ylab='Voltage')

plot(datetime, hpc$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(datetime, hpc$Sub_metering_2, col='red')
lines(datetime, hpc$Sub_metering_3, col='blue')
legend('topright', legend=names(hpc)[7:9], bty='n', lwd=2, col=c('black', 'red', 'blue'))

plot(datetime, hpc$Global_reactive_power, type='l', ylab='Global reactive power')
dev.off()