library(dplyr)
library(lubridate)
library(magrittr)
library(readr)
library(stringr)

power <- read_delim("~/Data Science/household_power_consumption.txt",
                    ";", col_types = cols(.default = "c"))

power$datetime <- str_c(power$Date, power$Time, sep = " ")
power$datetime <-dmy_hms(power$datetime)
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Date <- date(power$datetime)
power %<>% filter(Date=="2007-02-01" | Date== "2007-02-02")

png("plot2.png")
plot(power$date, power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
