source('load.R')
load('hpc.dat')

datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

png('plot3.png')
par(mar=c(3,5,2,2))
plot(datetime, hpc$Sub_metering_1, type='l', ylab='Energy sub metering')
lines(datetime, hpc$Sub_metering_2, col='red')
lines(datetime, hpc$Sub_metering_3, col='blue')
legend('topright', legend=names(hpc)[7:9], lwd=2, col=c('black', 'red', 'blue'))
dev.off()