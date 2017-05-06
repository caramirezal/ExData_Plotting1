
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



## Second plot
png("plot2.png")
plot(powEconData$DateTime[!is.na(powEconData$Global_active_power)],powEconData$Global_active_power[!is.na(powEconData$Global_active_power)],
     type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()

