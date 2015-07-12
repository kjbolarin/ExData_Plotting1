## reads data
df<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 

## explore and review data content
## head(df) 
## tail(df) 

##subsetting data to ensure that we use only data required for February 1 and 2
dataplott<- subset(df, df$Date=="1/2/2007"| df$Date=="2/2/2007")

## explore and review data content summary
## summary(dataplott)
## head(dataplott) 
## tail(dataplott)


## add  concatenate Date and Time columns to form DateTime column
dataplott$DateTime <- paste(dataplott$Date, dataplott$Time)
## summary(dataplott)
## head(dataplott) 
## tail(dataplott)

# #change the datetime field to a internal form for time  
dataplott$DateTime <-strptime(as.character(dataplott$DateTime), "%d/%m/%Y %H:%M:%S") 
## head(dataplott) 

##set ploote area to 1 row, 1 column
par(mfrow = c(1, 1))

## plot a line chart of DateTime vs Global_active_power; add y label as Global Active Power (kilowatts)
with(dataplott, plot(DateTime, Global_active_power,type ="l",xlab ="",ylab ="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png",width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off() ## close  PNG device!

