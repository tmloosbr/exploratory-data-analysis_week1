# read and subset data
x <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
x$Datum <- as.Date(strptime(x$Date,"%d/%m/%Y"))
y <- x[x$Datum == as.Date("2007-02-01") | x$Datum == as.Date("2007-02-02"),]
y$DatumTijd <- as.POSIXct(paste(y$Date, y$Time), format = "%d/%m/%Y%H:%M:%S")

#plot data
Sys.setlocale("LC_TIME", "English")
png('plot2.png', width=480, height=480)
plot(y$DatumTijd,y$Global_active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()