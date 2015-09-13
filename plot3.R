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

## Plot3
png(filename = "plot3.png",width = 480, height = 480)
with(filteredhpcdata,plot(datetime, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(filteredhpcdata,lines(datetime, Sub_metering_2,type="l",xlab="",ylab="",col="red"))
with(filteredhpcdata,lines(datetime, Sub_metering_3,type="l",xlab="",ylab="",col="blue"))
legend("topright", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()