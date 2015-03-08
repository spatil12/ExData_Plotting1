power_cons<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
twoday_pc2 <- power_cons[(power_cons$Date == "1/2/2007"| power_cons$Date == "2/2/2007"),]
twoday_pc2$DateTime <- paste(twoday_pc2$Date, twoday_pc2$Time, sep= " ")
twoday_pc2$DateTime <- strptime(twoday_pc2$DateTime, format ="%d/%m/%Y %H:%M:%S") 
png(file= "plot2.png", width = 480, height = 480)
plot(twoday_pc2$DateTime,twoday_pc2$Global_active_power, typ="l", ylab="Global Active Power (kilowatts)", xlab = "")

dev.off()