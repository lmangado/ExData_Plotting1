data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## I subset the data base to reduce computational power used when ploting
reducido <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Create a variable that combines date and time
fecha <- paste(reducido$Date, reducido$Time)
fecha <- strptime(fecha, "%Y-%m-%d %H:%M:%S")
reducido$Fecha <- fecha

## Plot 3

with(reducido, plot(Fecha, Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering"))
par(new=T)
with(reducido, lines(Fecha, Sub_metering_2, type="l", col="red", axes=F))
par(new=F)
with(reducido, lines(Fecha, Sub_metering_3, type="l", col="blue", axes=F))
par(new=F)
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "Plot3.png") ## Copy my plot to a PNG file
dev.off()



