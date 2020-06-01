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

#see what data is there
head(allData)

#get the data only for for 2007-02-01 and 2007-02-02. 
plotData<-allData[as.Date(allData$Date, "%d/%m/%Y")>=as.Date('01/02/2007', "%d/%m/%Y") & as.Date(allData$Date, "%d/%m/%Y") <= as.Date('02/02/2007',"%d/%m/%Y"),]

#Save as PNG of Plot of Histogram
png(file="plot1.png",width=450,height=450)
hist(as.numeric(plotData$Global_active_power), main= 'Global Active Power' ,xlab= 'Global Active Power (kilowatts)' , xlim =c(0,6), col="red", breaks=12)
dev.off()