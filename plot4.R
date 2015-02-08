# select only the data needed
library(sqldf)
power_consumption <- read.csv.sql(file="household_power_consumption.txt",
                                  sep=";",
                                  sql="select * from file 
                                  where Date in( '1/2/2007','2/2/2007')")

# Close the connection
sqldf()

# Date to be transformed
power_consumption <- transform(power_consumption,Date=strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

png(file="plot4.png",width=480,height=480)

# set the label text size 
par("ps"=12) 

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(power_consumption,{
    plot(Date,Global_active_power,type="l",ylab="Global Active Power",xlab="")
    plot(Date,Voltage,type="l",ylab="Voltage",xlab="datetime")
    plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    lines(Date,Sub_metering_2,col="red")
    lines(Date,Sub_metering_3,col="blue")
    legend("topright",lwd=1,col=c("black","red","blue"),bty="n",
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(Date,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})

dev.off()
