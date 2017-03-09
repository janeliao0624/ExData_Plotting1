##Loading the datas
setwd("C:/Users/Jane_Liao/Desktop/JL/Coursera/")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
datetime <- strptime(paste (subsetData$Date,subsetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
SubMetering1 <- as.numeric(subsetData$Sub_metering_1)
SubMetering2 <- as.numeric(subsetData$Sub_metering_2)
SubMetering3 <- as.numeric(subsetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd="1.5",col=c("black","red","blue"))
dev.off()
