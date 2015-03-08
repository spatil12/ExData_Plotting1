power_cons<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
twoday_pc4 <- power_cons[(power_cons$Date == "1/2/2007"| power_cons$Date == "2/2/2007"),]
twoday_pc4$DateTime <- paste(twoday_pc4$Date, twoday_pc4$Time, sep= " ")
twoday_pc4$DateTime <- strptime(twoday_pc4$DateTime, format ="%d/%m/%Y %H:%M:%S")
png(file= "plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))

plot(twoday_pc4$DateTime,twoday_pc4$Global_active_power, typ="l", ylab="Global Active Power (kilowatts)", xlab = "")
plot(twoday_pc4$DateTime,twoday_pc4$Voltage, typ="l", ylab="Voltage", xlab = "datetime")
with(twoday_pc4, plot(DateTime, Sub_metering_1, typ ="l",  ylab= "Energy sub metering", xlab =" ") )

with(twoday_pc4, points(DateTime, Sub_metering_2, type="l", col ="red"))
with(twoday_pc4, points(DateTime, Sub_metering_3, type="l", col ="blue"))
legend("topright", lwd= 1, col= c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(twoday_pc4$DateTime, twoday_pc3$Global_reactive_power, typ="l", ylab= "Global_reactive_power", xlab="datetime" )

dev.off()