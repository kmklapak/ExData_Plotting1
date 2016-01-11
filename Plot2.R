## Import dataset
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	             stringsAsFactors=FALSE, dec=".", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Get subset of data
dataSubset <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
data <- dataSubset

## Create Datetime objects
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create Plot 2

plot(data$Global_active_power~data$Datetime, type="line", 
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()