##Create the data directory
if(!file.exists("./data")){dir.create("./data")}
##Download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")
##unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#Assign header to the file
header1 <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage","GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
#read the data in interest in R
dataforplot <- read.table("./data/household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", nrows = 2879, skip = 66638, col.names = header1)
#Generate correct datetime
datetime <- strptime(paste(dataforplot$Date, dataforplot$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#plotting the graph
globalActivePower <- as.numeric(dataforplot$GlobalActivePower)
subMetering1 <- as.numeric(dataforplot$SubMetering1)
subMetering2 <- as.numeric(dataforplot$SubMetering2)
subMetering3 <- as.numeric(dataforplot$SubMetering3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
