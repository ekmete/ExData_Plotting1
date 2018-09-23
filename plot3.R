#Removes irrelevant data
rm(list = ls())

#reads in data from file then converts date format
fullpdata<-read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
fullpdata$Date<-as.Date(fullpdata$Date, format="%d/%m/%Y")

#generates a subset with specified data
pdata<-subset(fullpdata, (Date>="2007-02-01"& Date<= "2007-02-02"))

#removes full table
rm(fullpdata)

datetime<-strptime(paste(pdata$Date, pdata$Time), format="%Y-%m-%d %H:%M:%S")

#generates a png file
png(file="plot3.png")

plot(datetime, pdata$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

lines(datetime, pdata$Sub_metering_2, type="l", col="red")

lines(datetime, pdata$Sub_metering_3, type="l", col="blue")

legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()