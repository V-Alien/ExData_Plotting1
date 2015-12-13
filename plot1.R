library(dplyr)

# first set the corect working directory and then copy the unzipped household_power_consumption.txt file into this directory, then follow the below steps).

data_ex1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = '?')

# joining date with time

data_ex1$Date <- as.POSIXct(paste(data_ex1$Date, data_ex1$Time), format = "%d/%m/%Y %H:%M:%S")

data_ex1 <- data_ex1 %>% subset(Date >= "2007-02-01") %>% subset(Date < "2007-02-03")

save(data_ex1, file="data_ex1.Rda")

load("data_ex1.Rda")

#plot 1.R

load("data_ex1.Rda")

hist(data_ex1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = 'red')

dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()
