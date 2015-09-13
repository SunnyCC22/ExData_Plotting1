## Loading the data
## The dataset has 2,075,259 rows and 9 columns.

## First calculate a rough estimate of how much memory the dataset will require
## in memory before reading into R. Make sure the computer has enough memory.
2075259*9*8/1024^2
memory.limit() 

## Install sqldf package to subset data.
install.packages("sqldf")
library(sqldf)

## Download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","CourseProject1file.zip") 
unzip("CourseProject1file")


## Select data with the dates 2007-02-01 and 2007-02-02.
filteredhpcdata<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",head=T,sep=';')
head(filteredhpcdata)

## Plot4
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(filteredhpcdata,{
  plot(filteredhpcdata$datetime, filteredhpcdata$Global_active_power,xlab = "",type="l",ylab="Global Active Power")
  plot(filteredhpcdata$datetime, filteredhpcdata$Voltage,xlab = "datetime",type="l",ylab="Voltage")
  with(filteredhpcdata,plot(datetime, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
  with(filteredhpcdata,lines(datetime, Sub_metering_2,type="l",xlab="",ylab="",col="red"))
  with(filteredhpcdata,lines(datetime, Sub_metering_3,type="l",xlab="",ylab="",col="blue"))
  legend("topright", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,bty = "n")
  plot(filteredhpcdata$datetime, filteredhpcdata$Global_reactive_power,xlab = "datetime",type="l",ylab="Global_reactive_power")
})
dev.off()
