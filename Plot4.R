# read and subset data
x <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
x$Datum <- as.Date(strptime(x$Date,"%d/%m/%Y"))
y <- x[x$Datum == as.Date("2007-02-01") | x$Datum == as.Date("2007-02-02"),]
y$DatumTijd <- as.POSIXct(paste(y$Date, y$Time), format = "%d/%m/%Y%H:%M:%S")

# plot data
Sys.setlocale("LC_TIME", "English")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(y$DatumTijd, y$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(y$DatumTijd, y$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(y$DatumTijd, y$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(y$DatumTijd, y$Sub_metering_2, type="l", col="red")
lines(y$DatumTijd, y$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(y$DatumTijd, y$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()