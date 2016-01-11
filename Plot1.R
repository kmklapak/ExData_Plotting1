## Import dataset
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	             stringsAsFactors=FALSE, dec=".", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Get subset of data
dataSubset <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
data <- dataSubset

## Create Plot 1

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()