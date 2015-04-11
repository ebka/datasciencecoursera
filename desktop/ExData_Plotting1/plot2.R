
## This file is for loading the large dataset.
hsedata<- read.table("household_power_consumption.txt", sep=";",
                  header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subset data - relating to two days: 
febdata<- subset(hsedata, (hsedata$Date == "1/2/2007" | hsedata$Date== "2/2/2007")) 


# change the date format
febdata$Date <- as.Date(febdata$Date, format = "%d/%m/%Y")
febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time))

# creating Plot2
png(filename="plot2.png", width=480, height= 480)
plot(febdata$DateTime, febdata$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()


