
## Exploratory 
initTable <- read.table("household_power_consumption.txt",nrows =10,sep = ";",header = TRUE)
tbClasses <- sapply(initTable,class)

## Loading the table
initTable <- read.table("household_power_consumption.txt",nrows =103000,sep = ";",header = TRUE,stringsAsFactors = FALSE)
#head(initTable)
#tail(initTable)
#sapply(initTable,class)

## Loading the data
powEconData <- initTable[initTable$Date=="2/2/2007" | initTable=="1/2/2007",]
#head(powEconData)
#str(powEconData)

## Processing the data
dateStrings <- sapply(1:length(powEconData[,1]),function(x) paste(powEconData[x,1],powEconData[x,2]))
dateStrings <- gsub("/","-",dateStrings)
datesPowEc <- strptime(dateStrings,"%d-%m-%Y %H:%M:%S")
powEconData$"DateTime" <-datesPowEc
for (i in 3:(length(powEconData)-1)) {
        
        powEconData[,i] <- as.numeric(powEconData[,i]) 
        
}
#str(powEconData)


## First plot
png("plot1.png")
hist(powEconData$Global_active_power,xlab="Global Active Power",ylab = "Frequency",main = "Global Active Power",col = "red")
dev.off()


