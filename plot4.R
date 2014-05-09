## Plot 4: 4 Graphs
## 1) Y axis = Global Active Power; X axis = DateTime
## 2) Y axis = Voltage; X axis = DateTime
## 3) Y axis = Energy Sub metering (3 lines); X axis = DateTime
## 4) Y axis = Global_reactive_power; X axis = DateTime

dir <- "C:/Users/Sarah/COURSERA/ExData/ExData_Plotting1/"
setwd(dir)

## Read in the data for Feb 1-2
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))

## Combine Date and Time into one variable
hpc$DateTime <- as.POSIXct(paste(as.Date(hpc$Date, format="%d/%m/%Y"), hpc$Time), format="%Y-%m-%d %H:%M:%S", tx = "EST")

with(hpc, {
  #1
  plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power", cex.lab=.75, cex.axis=.75) 
  #2
  plot(DateTime, Voltage, type = "l", cex.lab=.75, cex.axis=.75)
  #3
  plot(DateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy Sub metering", cex.lab=.75, cex.axis=.75)
  lines(DateTime, Sub_metering_2, col = "red")     # using lines, instead of plot adds to the graph
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", lty=c(1,1), cex=.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  #4
  plot(DateTime, Global_reactive_power, type = "l", cex.lab=.75, cex.axis=.75) 
})

## Write to png
dev.copy(png, file = "plot4.png") 
dev.off() 

