setwd("~/Downloads")
unzip("exdata-data-household_power_consumption.zip", exdir = "Electric_power_consumption")
Power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
PowerTime <- strptime(Power$Time, format="%H:%M:%S")
PowerTime<-strftime(PowerTime, format="%H:%M:%S")
PowerDate<-as.Date(Power$Date,format="%d/%m/%Y")
class(Power$Global_active_power)
P<-Power$Global_active_power
G1<-data.frame(PowerDate,PowerTime,P)
Date1<-as.Date("2007-02-01")
Date2<-as.Date("2007-02-02")
G2<-G1[G1$PowerDate>=Date1&G1$PowerDate<=Date2,]
head(G2$P)
hist(G2$P,col=2,xlab="Global Active Power (kilowatts)", main="Global Active Power")
png(filename = "plot1.png",width = 480, height = 480)


