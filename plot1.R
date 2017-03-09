##Loading the datas
setwd("C:/Users/Jane_Liao/Desktop/JL/Coursera/")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
GlobalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()

