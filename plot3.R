##Assuming file is downloaded into your working directory
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE, dec=".")
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dateandtime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMetering1 <- as.numeric(datasubset$Sub_metering_1)
SubMetering2 <- as.numeric(datasubset$Sub_metering_2)
SubMetering3 <- as.numeric(datasubset$Sub_metering_3)
GlobalActivePower <- as.numeric(datasubset$Global_active_power)

png("plot3.png", widht=480, height=480)
plot(dateandtime, SubMetering1, type="l", xlab="", ylab="Energy sub metering", main="")
lines(dateandtime, SubMetering2, type="l", col="red")
lines(dateandtime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red","blue"))
dev.off()