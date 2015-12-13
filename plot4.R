library(dplyr)

# first set the corect working directory and then copy the unzipped household_power_consumption.txt file into this directory, then follow the below steps).

data_ex1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = '?')

# joining date with time

data_ex1$Date <- as.POSIXct(paste(data_ex1$Date, data_ex1$Time), format = "%d/%m/%Y %H:%M:%S")

data_ex1 <- data_ex1 %>% subset(Date >= "2007-02-01") %>% subset(Date < "2007-02-03")

save(data_ex1, file="data_ex1.Rda")

load("data_ex1.Rda")

# plot4.R

png('plot4.png', width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4, 4, 1, 1))

with(data_ex1, plot(Date, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))

with(data_ex1,lines(Date, Global_active_power))


with(data_ex1, plot(Date, Voltage, ylab = "Voltage", xlab = "datetime", type = "n"))

with(data_ex1,lines(Date, Voltage))


with(data_ex1, plot(Date, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))

with(data_ex1, lines(Date, Sub_metering_1, col = 'black'))

with(data_ex1, lines(Date, Sub_metering_2, col = 'red'))

with(data_ex1, lines(Date, Sub_metering_3, col = 'blue'))

legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font = 0.5)


with(data_ex1, plot(Date, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n"))

with(data_ex1,lines(Date, Global_reactive_power))


dev.off()
