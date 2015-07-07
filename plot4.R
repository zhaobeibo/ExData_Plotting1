# R script for generating plot4.png

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

# Construct plot with subplots
x <- Time
par(mar=c(4,4,1,1),mfcol=c(2,2))

# Top-left plot
y <- d3$Global_active_power
plot(x,y,xlab = "", ylab = "Global Active Power",col="white")
lines(x,y)

# Bottom-left plot
y1 <- d3$Sub_metering_1
y2 <- d3$Sub_metering_2
y3 <- d3$Sub_metering_3
plot(x,y1,xlab = "", ylab = "Energy sub metering",col="white")
lines(x,y1)
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("top", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",
       lty=c(1,1,1),col=c("black","blue","red"), cex = 0.5)

# Top-right plot
m <- d3$Voltage
plot(x,m, xlab="datetime",ylab = "Voltage",col="white",ylim=c(230,250),yaxt="n")
axis(2,at=seq(234,246,by=2),labels=c("234","236", "238","240","242","244","246"))
lines(x,m)

# Bottom-right plot
n <- d3$Global_reactive_power
plot(x,n,xlab = "datetime", ylab = "Global_reactive_power",col="white")
lines(x,n)





