# read data
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# change the class of variables
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mydata$Global_active_power)
globalReactivePower <- as.numeric(mydata$Global_reactive_power)
voltage <- as.numeric(mydata$Voltage)
subMetering1 <- as.numeric(mydata$Sub_metering_1)
subMetering2 <- as.numeric(mydata$Sub_metering_2)
subMetering3 <- as.numeric(mydata$Sub_metering_3)

# plots
par(mfrow = c(2, 2)) 
# plot1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# plot3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
# plot4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# create the png file
dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
