# R script for generating plot2.png

# Load data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings= "?")

# Process data to convert the Date variable to Date class 
# and to isolate dates 2007-02-01 and 2007-02-02 from the dataset 
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
data[,1] <- as.Date(data[,1],format = "%d/%m/%Y")

d1 <- subset(data, data$Date == date1)
d2 <- subset(data, data$Date == date2)
d3 <- rbind(d1,d2)

# Create a Time list that is of Time class from the isolated data 
# to help with plot construction
Time <- 0
for (i in 1:length(d3$Time)) {
  Time[i] <- paste(d3[i,1],d3[i,2])
}
Time <- strptime(Time,format ="%Y-%m-%d %H:%M:%S")

# Construct scatter plot with line
x <- Time
y <- d3$Global_active_power
par(mar=c(3,4,2,2))
plot(x,y,xlab = NULL, ylab = "Global Active Power(kilowatts)",col="white")
lines(x,y)
