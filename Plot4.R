## Import dataset
data <- read.table("../Data/household_power_consumption.txt", sep=";", header=TRUE, 
	             stringsAsFactors=FALSE, dec=".", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Get subset of data
dataSubset <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
data <- dataSubset

## Create Datetime objects
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Global_active_power~data$Datetime, type="line", 
     ylab="Global Active Power", xlab="")
plot(data$Voltage~data$Datetime, type="line", 
     ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~data$Datetime, type="line", 
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')
legend("topright", col=c("black","red","blue"), lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$Global_reactive_power~data$Datetime, type="line", 
     ylab="Global_reactive_power", xlab="datetime")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()