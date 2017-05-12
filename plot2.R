NDF<-read.csv("household.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=T, stringsAsFactors=F, comment.char="", quote='\"')
NDF$Date<-as.Date(NDF$Date,format="%d/%m/%Y")

## Subsetting the data
subNDF<-subset(NDF,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime = paste(as.Date(subNDF$Date), subNDF$Time)
subNDF$Datetime = as.POSIXct(datetime)
 
plot(subNDF$Global_active_power~subNDF$Datetime, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

dev.copy(png, "plot2.png")
dev.off()
