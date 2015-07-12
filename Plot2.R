data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## I subset the data base to reduce computational power used when ploting
reducido <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Create a variable that combines date and time
fecha <- paste(reducido$Date, reducido$Time)
fecha <- strptime(fecha, "%Y-%m-%d %H:%M:%S")
reducido$Fecha <- fecha

## Plot 2
with(reducido, plot(Fecha, Global_active_power, type="n", ylab = "Global Active Power (kilowatts)"))
with(reducido, lines(Fecha, Global_active_power)) 
dev.copy(png, file = "Plot2.png") ## Copy my plot to a PNG file
dev.off()

