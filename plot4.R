##Loading the datas
setwd("C:/Users/Jane_Liao/Desktop/JL/Coursera/")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
datetime <- strptime(paste (subsetData$Date,subsetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetData$Global_active_power)
SubMetering1 <- as.numeric(subsetData$Sub_metering_1)
SubMetering2 <- as.numeric(subsetData$Sub_metering_2)
SubMetering3 <- as.numeric(subsetData$Sub_metering_3)
GlobalReactivePower <- as.numeric(subsetData$Global_reactive_power)
Voltage <- as.numeric(subsetData$Voltage)
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(datetime,GlobalActivePower,type="l",xlab=" ",ylab = "Global Active Power (kilowatts)")

plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=,lwd="2.5",col=c("black","red","blue"),bty="o")

plot(datetime,Voltage,type="l",xlab="datetime",ylab = "Voltage")

plot(datetime,GlobalReactivePower,type="l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()