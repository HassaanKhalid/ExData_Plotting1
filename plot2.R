##Assuming file is downloaded into your working directory
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE, dec=".")
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dateandtime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(datasubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateandtime, GlobalActivePower, type="l", xlab="", ylab="GlobalActivePower (kilowatts)", main="")
dev.off()