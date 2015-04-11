
## This file is for loading the large dataset.
hsedata<- read.table("household_power_consumption.txt", sep=";",
                  header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subset data - relating to two days: 
febdata<- subset(hsedata, (hsedata$Date == "1/2/2007" | hsedata$Date== "2/2/2007")) 

# creating Plot1
png(filename="plot1.png", width=480, height=480)
#png("plot1.png", width=480, height= 480)

hist(febdata$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")

dev.off()