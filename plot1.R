#remove all previous objects from the current workspace

rm(list = ls())

#Read full data

fullpdata<-read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
head(fullpdata)

#convert date format
fullpdata$Date<-as.Date(fullpdata$Date, format="%d/%m/%Y")

#generate a subset with related data
pdata<-subset(fullpdata, (Date>="2007-02-01"& Date<= "2007-02-02"))

#we dont need full table anymore
rm(fullpdata)

#generate a png file
png(file="plot1.png")

#plot
with(pdata, hist(Global_active_power, col = "red", main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)"),ylab="Frequency")
#close device
dev.off()