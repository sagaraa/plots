NDF<-read.csv("household.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=T, stringsAsFactors=F, comment.char="", quote='\"')
NDF$Date<-as.Date(NDF$Date,format="%d/%m/%Y")

## Subsetting the data
subNDF<-subset(NDF,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

hist(NDF$Global_active_power, col = "red", xlab = " Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off()
