# R script for generating plot1.png

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

# Construct histogram and modify x-axis
hist(d3$Global_active_power,xlim=c(0,6),xaxt="n",
  col = "red",main = "Global Active Power",xlab = "Global Active Power (killowatts)")
axis(1,at=seq(0,6,by=2),labels=c("0", "2", "4","6"))



