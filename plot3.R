NDF<-read.csv("household.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=T, stringsAsFactors=F, comment.char="", quote='\"')
NDF$Date<-as.Date(NDF$Date,format="%d/%m/%Y")

## Subsetting the data
subNDF<-subset(NDF,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime = paste(as.Date(subNDF$Date), subNDF$Time)
subNDF$Datetime = as.POSIXct(datetime)

plot(subNDF$Sub_metering_1~subNDF$Datetime, type = "l", xlab = "", ylab = "Energy sub matering")
lines(subNDF$Sub_metering_2~subNDF$Datetime, col = "Red")
lines(subNDF$Sub_metering_3~subNDF$Datetime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()
