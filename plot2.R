library(sqldf)
#load filtered data
ec <- read.csv.sql("household_power_consumption.txt", header=T, sep=";" ,"select * from file where Date='1/2/2007' or Date='2/2/2007'")

#make a timestaps
dt<-paste(ec$Date,ec$Time ,sep=" ")
#create a column in a dataset with a timestamps
ec$tiestamp<-strptime(dt,"%d/%m/%Y %H:%M:%S")

#prepare output device
png(filename="plot2.png",width=480,height=480,units="px")

#draw
plot(ec$tiestamp, ec$Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)")

#save to a file
dev.off()

