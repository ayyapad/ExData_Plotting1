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

png(file="plot2.png",width=480,height=480)

# set the label text size 
par("ps"=12) 

with(power_consumption,plot(Date,Global_active_power,type="l",
             ylab="Global Active Power (kilowatts)",xlab=""))

dev.off()