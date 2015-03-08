power_cons<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
twoday_pc3 <- power_cons[(power_cons$Date == "1/2/2007"| power_cons$Date == "2/2/2007"),]
twoday_pc3$DateTime <- paste(twoday_pc3$Date, twoday_pc3$Time, sep= " ")
twoday_pc3$DateTime <- strptime(twoday_pc3$DateTime, format ="%d/%m/%Y %H:%M:%S") 
png(file= "plot3.png", width = 480, height = 480)
with(twoday_pc3, plot(DateTime, Sub_metering_1, typ ="l",  ylab= "Energy sub metering", xlab =" ") )
 
with(twoday_pc3, points(DateTime, Sub_metering_2, type="l", col ="red"))
 with(twoday_pc3, points(DateTime, Sub_metering_3, type="l", col ="blue"))
legend("topright", lwd= 1, col= c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()