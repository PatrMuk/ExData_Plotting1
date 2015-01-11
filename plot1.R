ProjectData <- file("household_power_consumption.txt")
Plot1 <- read.table(text = grep("^[1,2]/2/2007", readLines(ProjectData), value = TRUE), col.names = c("Date", "Time", "Global_active_power", 
                                                                                                      "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#Getting the required plot
hist(Plot1$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

## Generate PNG file
dev.copy(png,file = "plot1.png")
dev.off()