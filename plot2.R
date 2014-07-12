data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
# Bring up a PNG device.
png(filename='plot2.png', width=480,height=480)
# Start plotting the graph of Global Active Power.
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$DateTime, data$Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab='')
# Done, close the graphics device.
dev.off()
