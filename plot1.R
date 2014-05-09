## Plot 1: Bar Graph of Global Active Power 
## X axis = Global Active Power(kilowatts) -> column 3
## Y axis = Frequency

dir <- "C:/Users/Sarah/COURSERA/ExData/ExData_Plotting1/"
setwd(dir)
## Read in the data for Feb 1-2
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                  nrow = 1, header = TRUE, sep=";")))

## Create the histogram
hist(hpc$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power(kilowatts)", ylab="Frequency")

## Write to png
dev.copy(png, file = "plot1.png") 
dev.off()