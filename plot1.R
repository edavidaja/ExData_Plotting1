library(dplyr)
library(lubridate)
library(magrittr)
library(readr)

power <- read_delim("~/Data Science/household_power_consumption.txt",
                    ";", escape_backslash = TRUE, col_types = cols(Time = col_character()))

power$Date <- dmy(power$Date)

power %<>% filter(Date=="2007-02-01" | Date== "2007-02-02")

png("plot1.png")
hist(power$Global_active_power,
    col = "red",
    main  = "Global Active Power",
    xlab = "Global Active Power")
dev.off()
