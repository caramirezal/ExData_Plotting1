
## Exploratory 
initTable <- read.table("household_power_consumption.txt",nrows =10,sep = ";",header = TRUE)
tbClasses <- sapply(initTable,class)

## Loading the table
initTable <- read.table("household_power_consumption.txt",nrows =103000,sep = ";",header = TRUE,stringsAsFactors = FALSE)


## Loading the data on 
powEconData <- initTable[initTable$Date=="2/2/2007" | initTable=="1/2/2007",]


## Processing the data
dateStrings <- sapply(1:length(powEconData[,1]),function(x) paste(powEconData[x,1],powEconData[x,2]))
dateStrings <- gsub("/","-",dateStrings)
datesPowEc <- strptime(dateStrings,"%d-%m-%Y %H:%M:%S")
powEconData$"DateTime" <-datesPowEc
for (i in 3:(length(powEconData)-1)) {
        
        powEconData[,i] <- as.numeric(powEconData[,i]) 
        
}




## Third plot
png("plot3.png")
plot(powEconData$DateTime,powEconData$Sub_metering_1,col="gray",type = "l",xlab = "",ylab = "Energy sub metering")
lines(powEconData$DateTime,powEconData$Sub_metering_2,col="red",type = "l")
lines(powEconData$DateTime,powEconData$Sub_metering_3,col="blue",type="l")
legend("topright",lty=rep(1,3),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("gray","red","blue"))
dev.off()



