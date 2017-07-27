## Reading the data
data_read <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_read$Date <- as.Date(data_read$Date, format="%d/%m/%Y")

sub_data <- subset(data_read, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_read)

##  dates conversion
date_data <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(date_data)

##  Plot 1 
hist(sub_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()