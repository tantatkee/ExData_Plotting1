data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
# Bring up a PNG device.
png(filename='plot1.png', width=480,height=480)
# Start plotting the histogram of Global Active Power.
hist(data$Global_active_power, xlab = 'Global Active Power (kilowatts)', ylim=c(0,1200), col='red', main='Global Active Power')
# Done, close the graphics device.
dev.off()
