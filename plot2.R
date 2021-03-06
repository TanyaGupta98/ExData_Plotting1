# Given data is stored in working directory
# Reading the data and subset required Data


pwr <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pwr) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sbpwr <- subset(pwr,pwr$Date=="1/2/2007" | pwr$Date =="2/2/2007")


subpwr$Date <- as.Date(subpwr$Date, format="%d/%m/%Y")
subpwr$Time <- strptime(subpwr$Time, format="%H:%M:%S")
subpwr[1:1440,"Time"] <- format(subpwr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpwr[1441:2880,"Time"] <- format(subpwr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#graph plot
png("plot2.png", width=480, height=480)

plot(subpwr$Time,as.numeric(as.character(subpwr$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()
