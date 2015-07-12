data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## I subset the data base to reduce computational power used when ploting
reducido <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Create a variable that combines date and time and add it to data frame
fecha <- paste(reducido$Date, reducido$Time)
fecha <- strptime(fecha, "%Y-%m-%d %H:%M:%S")
reducido$Fecha <- fecha

## Plot 1
hist(reducido$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot1.png") ## Copy my plot to a PNG file
dev.off()

