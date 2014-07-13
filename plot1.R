plot1 <- function() {
    file <- "household_power_consumption.txt"
    orig <- read.table(file, header = TRUE, sep = ";")
    orig$Date <- as.Date(orig$Date, format = "%d/%m/%Y")
    timeframe <- paste(orig$Date, orig$Time)
    tdt <- strptime(timeframe, format = "%Y-%m-%d %H:%M:%S")
    orig$Time <- tdt
    dat <- orig[(orig$Date == "2007-02-01" | orig$Date == "2007-02-02") ,]
    rdat <- as.numeric(a$Global_active_power)
    xlabel = "Global Active Power (kilowatts)"
    main = "Global Active Power"
    hist(rdat, col = "red", xlab = xlabel, main = main)
    dev.copy(png, file = "plot1.png")
    dev.off()
}