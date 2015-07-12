## reads data
df<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 

## explore and review data content
  ## head(df) 
  ## tail(df) 

##subsetting data to ensure that we use only data required for February 1 and 2
dataplott<- subset(df, df$Date=="1/2/2007"| df$Date=="2/2/2007")

## summary(dataplott)
## head(dataplott) 
## tail(dataplott)

## add new dateTime by concatenate Date and Time columns
dataplott$DateTime <- paste(dataplott$Date, dataplott$Time)

## summary(dataplott)
## head(dataplott) 
## tail(dataplott)

##change the datetime field to a internal form for time  
dataplott$DateTime <-strptime(as.character(dataplott$DateTime), "%d/%m/%Y %H:%M:%S")

## review content
## head(dataplott) 

## multi plot on screen device
par(mfrow = c(2, 2))
with(dataplott,
      {
        plot(DateTime, Global_active_power,type ="l",ylab ="Global Active Power",xlab ="", col="black")
        plot(DateTime, Voltage,type ="l",ylab ="Voltage",xlab ="datetime", col="black")
        plot(DateTime, Sub_metering_1,type ="l",ylab ="Energy sub metering",xlab ="", col="black")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright", pch = "_",xjust=1,col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(DateTime, Global_reactive_power,type ="l", ylab ="Global_reactive_power",xlab ="datetime", col="black")
      }
    )

dev.copy(png, file = "plot4.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## close  PNG device!


