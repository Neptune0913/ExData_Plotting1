# read data
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# plot
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mydata$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# create the png file
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()
