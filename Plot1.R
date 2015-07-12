## reads data
df<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 

## explore and review data content
## head(df) 
## tail(df) 

##subsetting data to ensure that we use only data required for February 1 and 2
dataplott<- subset(df, df$Date=="1/2/2007"| df$Date=="2/2/2007")

## explore and review data content summary
##summary(dataplott)

##set plot area to 1 row, 1 column
par(mfrow = c(1, 1))

##plot Global Active Power histogram and  set color to red and  add x label and chart title
hist(dataplott$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png, file = "plot1.png",width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off() ## close  PNG device!
