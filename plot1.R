#Removes irrelevant data
rm(list = ls())

#reads in data from file then converts date format
fullpdata<-read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
fullpdata$Date<-as.Date(fullpdata$Date, format="%d/%m/%Y")

#generates a subset with specified data
pdata<-subset(fullpdata, (Date>="2007-02-01"& Date<= "2007-02-02"))

#removes full table
rm(fullpdata)

#generates png file
png(file="plot1.png")

with(pdata, hist(Global_active_power, col = "red", main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)"),ylab="Frequency")
dev.off()