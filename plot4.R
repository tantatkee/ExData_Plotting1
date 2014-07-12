data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
# Bring up a PNG device.
png(filename='plot4.png', width=480,height=480)
# Start plotting the 4 graphs.
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
par(mfcol = c(2,2))
# sub-plot (1,1)
plot(data$DateTime, data$Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab='')
# sub-plot (2,1)
plot(data$DateTime, data$Sub_metering_1, type='l', col='black', ylab = 'Energy sub metering', xlab='')
lines(data$DateTime, data$Sub_metering_2, type='l', col='red')
lines(data$DateTime, data$Sub_metering_3, type='l', col='blue')
legend(x='topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=1, col=c('black', 'red', 'blue'))
# sub-plot (1,2)
plot(data$DateTime, data$Voltage, type='l', ylab = 'Voltage', xlab='datetime')
# sub-plot (2,2)
plot(data$DateTime, data$Global_reactive_power, type='l', ylab = 'Global_reactive_power', xlab='datetime')
# Done, close the graphics device.
dev.off()
