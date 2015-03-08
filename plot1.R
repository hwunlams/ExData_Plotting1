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
#Plotting the graph
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()