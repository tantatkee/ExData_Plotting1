data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
# Bring up a PNG device.
png(filename='plot3.png', width=480,height=480)
# Start plotting the graph of Sub metering 1, 2, and 3.
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$DateTime, data$Sub_metering_1, type='l', col='black', ylab = 'Energy sub metering', xlab='')
lines(data$DateTime, data$Sub_metering_2, type='l', col='red')
lines(data$DateTime, data$Sub_metering_3, type='l', col='blue')
legend(x='topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=1, col=c('black', 'red', 'blue'))
# Done, close the graphics device.
dev.off()
