test <- function(){
  

  
  setwd("C:/mahesh")
  library(lubridate)
  
  power_data <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=T,colClasses=c("character","character",rep("numeric",7)))
  head(power_data)
  power_data_mini <- power_data[power_data$Date=="1/2/2007" | power_data$Date=="2/2/2007",]
  
 power_data_mini$Date <-dmy(power_data_mini$Date)
 power_data_mini$Time <-hms(power_data_mini$Time)
 power_data_mini$day_of_week <- weekdays(power_data_mini$Date)

 head(power_data_mini)
# png(filename="c:/mahesh/plot2.png", height=450, width=450 )
par(mfrow=c(2,2))

# Plot 1 on this plot
max_y <- max(power_data_mini$Global_active_power)
plot2 <- plot(power_data_mini$Global_active_power,type="l",ylim=c(0,max_y), axes=FALSE, ann=FALSE)
title(ylab="Global Active Power (kilowatts)")
axis(2, las=1, at=2*0:max_y)
axis(1, at=1:3, lab=c( "Thu", "Fri","Sat"))
box()

plot2

# Plot 2 on this plot
max_y2 <- max(power_data_mini$Voltage)
plot5 <- plot(power_data_mini$Voltage,type="l",ylim=c(224,max_y2), axes=FALSE, ann=FALSE)
title(ylab="Voltage")
title(xlab="datetime")
axis(2, las=1, at=2*0:max_y2)
axis(1, at=1:3, lab=c( "Thu", "Fri","Sat"))
box()

plot5


# Plot 3 on this plot
g_range <- range(0, power_data_mini$Sub_metering_1, power_data_mini$Sub_metering_2,power_data_mini$Sub_metering_3)

 max_y1 <- max(power_data_mini$Sub_metering_1)
 plot3 <- plot(power_data_mini$Sub_metering_1,type="l",ylim=c(0,max_y1), axes=FALSE, ann=FALSE)
 lines(power_data_mini$Sub_metering_2, type="l", col="red")
lines(power_data_mini$Sub_metering_3, type="l",  col="blue")
 title(ylab="Energy Sub Metering")
 axis(2, las=1, at=10*0:max_y1)
 axis(1, at=1:3, lab=c( "Thu", "Fri","Sat"),tick=T)
 box()
 
legend("topright", g_range[3], c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5,lty=1, lwd=2,  col=c("black","red","blue"));
  
 plot3



# Plot 4 on this plot
max_y3 <- max(power_data_mini$Global_reactive_power)
plot6 <- plot(power_data_mini$Global_reactive_power,type="l",ylim=c(0,max_y3), axes=FALSE, ann=FALSE)
title(ylab="Global_reactive_power")
title(xlab="datetime")
axis(2, las=0, at=0.1*0:max_y3)
axis(1, at=1:3, lab=c( "Thu", "Fri","Sat"))
box()

plot5

 dev.copy(png,filename="c:/mahesh/plot4.png");
 dev.off ();

}