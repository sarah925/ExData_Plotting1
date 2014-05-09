## Plot 2: Line Graph 
## X axis = Thu, Fri, Sat
## Y axis = Global Active Power(kilowatts)

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
with(hpc, plot(DateTime, Global_active_power, type = "l", ylab="Global Active Power(kilowatts)"))

## Write to png
dev.copy(png, file = "plot2.png") 
dev.off() 