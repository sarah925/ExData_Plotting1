## Plot 3: Line Graph with 3 lines
## X axis = Thu, Fri, Sat
## Y axis = Energy Sub metering

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

## Create the plot
with(hpc, plot(DateTime, Sub_metering_1, type = "l", ylab="Energy Sub metering"))
with(hpc, lines(DateTime, Sub_metering_2, col = "red"))       # using lines, instead of plot adds to the graph
with(hpc, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1), cex=.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                 # lty gives the line symbol and cex changes size of legend

## Write to png
dev.copy(png, file = "plot3.png") 
dev.off() 


