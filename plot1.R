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
 histogram1 <- hist(power_data_mini$Global_active_power,xlab="Global Active Power (kilowatt)", main="Global Active Power", col="red")
 histogram1

 dev.copy(png,filename="c:/mahesh/plot1.png");
 dev.off ();

}