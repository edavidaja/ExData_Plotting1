library(dplyr)
library(lubridate)
library(magrittr)
library(readr)
library(stringr)

power <- read_delim("~/Data Science/household_power_consumption.txt",
                    ";", col_types = cols(.default = "c"))

power$datetime <- str_c(power$Date, power$Time, sep = " ")
power$datetime <-dmy_hms(power$datetime)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
power$Date <- date(power$datetime)
power %<>% filter(Date=="2007-02-01" | Date== "2007-02-02")

yrange<-range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3))

png("plot3.png")
plot(power$date, power$Sub_metering_1, type = "l", xlab = "", ylab  = "Energy sub metering")
lines(power$date,power$Sub_metering_2, type = "l", col = "red")
lines(power$date,power$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       fill = c("black", "red", "blue"))
dev.off()
