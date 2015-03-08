power_cons<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
twoday_pc1 <- power_cons[(power_cons$Date == "1/2/2007"| power_cons$Date == "2/2/2007"),]

png(file= "plot1.png", width = 480, height = 480)
with(twoday_pc1, hist(Global_active_power, col ="red", main= "Global Active Power"))

dev.off()