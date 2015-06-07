#writing function to graph plot 1
plot1<-function() {
#loading data
setwd("~/Downloads")
unzip("exdata-data-household_power_consumption.zip", exdir = "Electric_power_consumption")
Power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
#changing Date/Time Formats
PowerTime <- strptime(Power$Time, format="%H:%M:%S")
PowerTime<-strftime(PowerTime, format="%H:%M:%S")
PowerDate<-as.Date(Power$Date,format="%d/%m/%Y")
#Pulling active power and combining into Data Set with Date
P<-Power$Global_active_power
G1<-data.frame(PowerDate,PowerTime,P)
Date1<-as.Date("2007-02-01")
Date2<-as.Date("2007-02-02")
#Restricitng data to the two days in 2007
G2<-G1[G1$PowerDate>=Date1&G1$PowerDate<=Date2,]
#making the graph
par(mfrow=c(1, 1))
hist(G2$P,col=2,xlab="Global Active Power (kilowatts)", main="Global Active Power")
#saving the graph as png
png(filename = "plot1.png",width = 480, height = 480)
}
#calling the function
plot1()


