Global_dataSet <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
Global_dataSet$Date <- as.Date(Global_dataSet$Date, format = "%d/%m/%Y")

data <- subset(Global_dataSet, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Global_dataSet)


datetime <- paste(as.Date(data$Date), data$Time) ## Converting dates
data$Datetime <- as.POSIXct(datetime)

## Generate Plot 
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
## Generate PNG file
dev.copy(png,file = "plot2.png")
dev.off()