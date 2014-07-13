getDat <- function() {
    file <- "household_power_consumption.txt"
    orig <- read.table(file, header = TRUE, sep = ";")
    orig$Date <- as.Date(orig$Date, format = "%d/%m/%Y")
    timeframe <- paste(orig$Date, orig$Time)
    tdt <- strptime(timeframe, format = "%Y-%m-%d %H:%M:%S")
    orig$Time <- tdt
    dat <- orig[(orig$Date == "2007-02-01" | orig$Date == "2007-02-02") ,]
}