# read data
power <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

Sys.setlocale("LC_TIME", "C")
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")


# plot4
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(power, {
        plot(datetime, Global_active_power,type="l", xlab="", ylab="Global Active Power")
        plot(datetime, Voltage, type="l", ylab="Voltage")   
        
        with(power, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
        lines(power$datetime, power$Sub_metering_2, col="red")
        lines(power$datetime, power$Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1, bty="n")
        
        plot(datetime, Global_reactive_power, type="l")
})
dev.off()
