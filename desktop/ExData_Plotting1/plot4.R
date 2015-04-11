
## This file is for loading the large dataset.
hsedata<- read.table("household_power_consumption.txt", sep=";",
                  header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subset data - relating to two days: 
febdata<- subset(hsedata, (hsedata$Date == "1/2/2007" | hsedata$Date== "2/2/2007")) 

# change the date format
febdata$Date <- as.Date(febdata$Date, format = "%d/%m/%Y")
febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time))

# creating Plot4
png(filename="plot4.png", width = 480, height = 480)

# divide the plot device into four subplots
par(mfrow=c(2,2)) 

# top left
plot(febdata$DateTime, febdata$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

# top right
plot(febdata$DateTime, febdata$Voltage, type="l", xlab="datetime", ylab="Voltage")   

# bottom left
plot(febdata$DateTime, febdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(febdata$DateTime, febdata$Sub_metering_2, type="l", col="red")
lines(febdata$DateTime, febdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# bottom right
plot(febdata$DateTime, febdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

dev.off()


