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
  
 
 max_y <- max(power_data_mini$Global_active_power)
 plot2 <- plot(power_data_mini$Global_active_power,type="l",ylim=c(0,max_y), axes=FALSE, ann=FALSE)
 title(ylab="Global Active Power (kilowatts)")
 axis(2, las=1, at=2*0:max_y)
 axis(1, at=1:3, lab=c( "Thu", "Fri","Sat"))
 box()
 
 plot2

 dev.copy(png,filename="c:/mahesh/plot2.png");
 dev.off ();

}