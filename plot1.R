# select only the data needed
library(sqldf)
power_consumption <- read.csv.sql(file="household_power_consumption.txt",
                                  sep=";",
                                  sql="select * from file 
                                       where Date in( '1/2/2007','2/2/2007')")

# Close the connection
sqldf()

# Date to be transformed
png(file="plot1.png",width=480,height=480)

# set the label text size 
par("ps"=12) 

hist(power_consumption$Global_active_power, main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)")

dev.off()