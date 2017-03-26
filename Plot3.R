# read and subset data
x <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
x$Datum <- as.Date(strptime(x$Date,"%d/%m/%Y"))
y <- x[x$Datum == as.Date("2007-02-01") | x$Datum == as.Date("2007-02-02"),]
y$DatumTijd <- as.POSIXct(paste(y$Date, y$Time), format = "%d/%m/%Y%H:%M:%S")

# plot data
Sys.setlocale("LC_TIME", "English")
png('plot3.png', width=480, height=480)
plot(y$DatumTijd,y$Sub_metering_1, type= "l", ylab = "Energy sub metering", xlab = "")
lines(y$DatumTijd,y$Sub_metering_2, type= "l", col = "red")
lines(y$DatumTijd,y$Sub_metering_3, type= "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()