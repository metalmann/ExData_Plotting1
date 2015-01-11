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
  
g_range <- range(0, power_data_mini$Sub_metering_1, power_data_mini$Sub_metering_2,power_data_mini$Sub_metering_3)

 max_y <- max(power_data_mini$Sub_metering_1)
 plot3 <- plot(power_data_mini$Sub_metering_1,type="l",ylim=c(0,max_y), axes=FALSE, ann=FALSE)
 lines(power_data_mini$Sub_metering_2, type="l", col="red")
lines(power_data_mini$Sub_metering_3, type="l",  col="blue")
 title(ylab="Energy Sub Metering")
 axis(2, las=1, at=10*0:max_y)
 axis(1, at=1:3, lab=c( "Thu", "Fri","Sat"),tick=T)
 box()
 
legend("topright", g_range[3], c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5,lty=1, lwd=2,  col=c("black","red","blue"));
      


 plot3

 dev.copy(png,filename="c:/mahesh/plot3.png");
 dev.off ();

}