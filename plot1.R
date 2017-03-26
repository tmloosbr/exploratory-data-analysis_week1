#read and subset data
x <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
x$Datum <- as.Date(strptime(x$Date,"%d/%m/%Y"))
y <- x[x$Datum == as.Date("2007-02-01") | x$Datum == as.Date("2007-02-02"),]

#plot data
Sys.setlocale("LC_TIME", "English")
png('plot1.png', width=480, height=480)
hist(y$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = c("red"))
dev.off()