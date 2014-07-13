# read data
power <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

head(power)
str(power)
summary(power)

#power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

# plot1
png(filename = "plot1.png",width = 480, height = 480)
hist(power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

# plot2
Sys.setlocale("LC_TIME", "C")
power$weekday <- weekdays(power$Date)
power$datetime <- paste(power$Date, power$Time)
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)
with(power, plot(datetime, Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

# plot3
png(filename = "plot3.png",width = 480, height = 480)
with(power, plot(datetime, Global_intensity, type="n", xlab="", ylab="Energy sub metering", ylim=c(0, 38)))
with(subset(power, Sub_metering_1>0), lines(datetime, Sub_metering_1))
with(subset(power, Sub_metering_2>0), lines(datetime, Sub_metering_2, col="red"))
with(subset(power, Sub_metering_3>0), lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1)
dev.off()



# plot4
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(power, {
        plot(datetime, Global_active_power,type="l", xlab="", ylab="Global Active Power")
        plot(datetime, Voltage, type="l", ylab="Voltage")   
        
        plot(datetime, Global_intensity, type="n", xlab="", ylab="Energy sub metering", ylim=c(0, 38))
        with(subset(power, Sub_metering_1>0), lines(datetime, Sub_metering_1))
        with(subset(power, Sub_metering_2>0), lines(datetime, Sub_metering_2, col="red"))
        with(subset(power, Sub_metering_3>0), lines(datetime, Sub_metering_3, col="blue"))
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1, bty="n")

        plot(datetime, Global_reactive_power, type="l")
})
dev.off()








