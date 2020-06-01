#fyi: setwd("C:/Users/dbaeva/Documents/Learning/Coursera/4. Exploritory Data Analysis/week1")
#get the file if it's not already downloaded
if (!file.exists("Week1File.zip")){ 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","Week1File.zip")
}
#if txt file is not there unzip it from main file
if (!file.exists("household_power_consumption.txt")){ 
  unzip("Week1File.zip")
}

#read data into the table
allData<-read.table("household_power_consumption.txt",sep= ";", header=TRUE, na.strings="?")


#get the data only for for 2007-02-01 and 2007-02-02. 
plotData<-allData[as.Date(allData$Date, "%d/%m/%Y")>=as.Date('01/02/2007', "%d/%m/%Y") & as.Date(allData$Date, "%d/%m/%Y") <= as.Date('02/02/2007',"%d/%m/%Y"),]


#ping3
png(file="plot3.png",width=450,height=450)
plot(strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S"),plotData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col ="black")
lines(strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S"), plotData$Sub_metering_2, col="red")
lines(strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S"),plotData$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col ="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill=c("black","red","blue"))
dev.off()