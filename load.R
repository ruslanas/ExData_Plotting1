# download, unzip, load, subset, save

url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
fname <- 'household_power_consumption.zip'

if(!file.exists(fname)) {
    download.file(url, fname)
    unzip(fname)
    
    # column classes
    colv <- c("character", #Date
              "character", #Time
              'numeric', #Global_active_power
              'numeric', #Global_reactive_power
              'numeric', #Voltage
              'numeric', #Global_intensity
              'numeric', #Sub_metering_1
              'numeric', #Sub_metering_2
              'numeric' #Sub_metering_3
              )
    
    hpc <- read.csv('household_power_consumption.txt', sep=';',
                    colClasses=colv,
                    na.strings=c('?'))
    
    # subset two days. Total 2880 (2 * 24 * 60)
    dates <- as.Date(hpc$Date, '%d/%m/%Y')
    hpc <- hpc[dates == '2007-02-01' | dates == '2007-02-02',]
    
    # save for later usage
    save(hpc, file='hpc.dat')
    
    # free memory
    remove(hpc, dates, colv)
    
}

# free memory
remove(url, fname)
