plot3 <- function() {
    file <- "household_power_consumption.txt"
    orig <- read.table(file, header = TRUE, sep = ";")
    orig$Date <- as.Date(orig$Date, format = "%d/%m/%Y")
    timeframe <- paste(orig$Date, orig$Time)
    tdt <- strptime(timeframe, format = "%Y-%m-%d %H:%M:%S")
    orig$Time <- tdt
    dat <- orig[(orig$Date == "2007-02-01" | orig$Date == "2007-02-02") ,]
    ylabel = "Energy sub metering"
    nam <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    ltype <- c(1,1)
    lcol <- c("black", "red", "blue")
    lwid <- c(2, 2, 2)
    plot(dat$Time, dat$Sub_metering_1, type = "n", xlab = "", ylab = ylabel)
    points(dat$Time, dat$Sub_metering_1, type = "l")
    points(dat$Time, as.numeric(dat$Sub_metering_2)/6, type = "l", col = "red")
    points(dat$Time, dat$Sub_metering_3, type = "l", col = "blue")
    legend("topright", nam, lty = ltype, lwd = lwid, col = lcol, cex = 3/4)
    dev.copy(png, file = "plot3.png")
    dev.off()
}