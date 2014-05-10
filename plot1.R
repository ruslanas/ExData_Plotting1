# download or load saved variable.
source('load.R')
load('hpc.dat')

png('plot1.png')
par(mar=c(5,5,2,2))
hist(hpc$Global_active_power, col=c('red'),
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()