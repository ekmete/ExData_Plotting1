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
png(file="plot4.png")

par(mfrow = c(2,2))

#1st graph in 1st row
plot(datetime, pdata$Global_active_power, type="l", xlab = "", ylab = "Global Active Power") 

#2nd graph in 1st row
plot(datetime, pdata$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#1st graph in 2nd row
plot(datetime, pdata$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

lines(datetime, pdata$Sub_metering_2, type="l", col="red")

lines(datetime, pdata$Sub_metering_3, type="l", col="blue")

legend("topright", lty= 1, bty="n", col = c("Black", "red", "blue"), 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#2nd graph in 2nd row
plot(datetime, pdata$Global_reactive_power, type="l", xlab = "datetime", 
     ylab = "Global_reactive_power")

#close device
dev.off()