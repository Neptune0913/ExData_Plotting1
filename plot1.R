# read data
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# plot
globalActivePower <- as.numeric(mydata$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")

# create the png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
