

knitr::opts_chunk$set(tidy.opts= list( width.cutoff = 60), tidy=TRUE)
library(tidyverse)

#read in the data

all_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)


#Set Variable Types
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
all_data$Global_active_power <- as.numeric(all_data$Global_active_power)
all_data$Sub_metering_1<- as.numeric(all_data$Sub_metering_1)
all_data$Sub_metering_2<- as.numeric(all_data$Sub_metering_2)
all_data$Sub_metering_3<- as.numeric(all_data$Sub_metering_3)
all_data$Voltage <- as.numeric(all_data$Voltage)
all_data$Global_reactive_power <- as.numeric(all_data$Global_reactive_power)



#Select dates
my.data <- all_data %>% filter(Date=="2007-02-01"|Date == "2007-02-02")
my.data <- my.data %>%  mutate(datetime1 = paste(as.Date(my.data$Date), my.data$Time))
my.data$Datetime <- as.POSIXct(my.data$datetime1)


#Create plot1
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(my.data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col = "red")
dev.off()




