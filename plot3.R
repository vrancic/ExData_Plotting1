library(sqldf)
#load filtered data
ec <- read.csv.sql("household_power_consumption.txt", header=T, sep=";" ,"select * from file where Date='1/2/2007' or Date='2/2/2007'")

#make a timestaps
dt<-paste(ec$Date,ec$Time ,sep=" ")
#create a column in a dataset with a timestamps
ec$tiestamp<-strptime(dt,"%d/%m/%Y %H:%M:%S")

#prepare output device
png(filename="plot3.png",width=480,height=480,units="px")

#draw
with(ec,
     plot(ec$tiestamp, ec$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=range(c(ec$Sub_metering_1,ec$Sub_metering_2,ec$Sub_metering_3)))
)
par(new=TRUE)
with(ec,
     plot(ec$tiestamp, ec$Sub_metering_2,type="l",xlab="",ylab="",col = "red",ylim=range(c(ec$Sub_metering_1,ec$Sub_metering_2,ec$Sub_metering_3)))
)  
par(new=TRUE)
with(ec,
     plot(ec$tiestamp, ec$Sub_metering_3,type="l",xlab="",ylab="",col = "blue",ylim=range(c(ec$Sub_metering_1,ec$Sub_metering_2,ec$Sub_metering_3)))
)  

legend("topright", pch = "-", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save to a file
dev.off()

