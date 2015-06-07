#writing function to graph plot 2
plot2<-function(){
    #loading data
    setwd("~/Downloads")
    unzip("exdata-data-household_power_consumption.zip", exdir = "Electric_power_consumption")
    Power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
    #changing Date/Time Formats
    PowerTime <- strptime(Power$Time, format="%H:%M:%S")
    PowerTime<-strftime(PowerTime, format="%H:%M:%S")
    PowerDate<-as.Date(Power$Date,format="%d/%m/%Y")
    G1<-data.frame(PowerDate,PowerTime,Power[,3:9])
    Date1<-as.Date("2007-02-01")
    Date2<-as.Date("2007-02-02")
    #Restricitng data to the two days in 2007
    G2<-G1[G1$PowerDate>=Date1&G1$PowerDate<=Date2,]
    #Combinig Date and Time to one column
    DateTime<-paste(G2$PowerDate,G2$PowerTime)
    DateTime<-as.POSIXct(DateTime, format="%Y-%m-%d %H:%M:%S")
    #making the graph
    par(mfrow=c(1, 1))
    plot(DateTime, G2$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
    #saving the graph
    dev.copy(png,file = "plot2.png", width = 480, height = 480)
    dev.off()
    }
plot2()

