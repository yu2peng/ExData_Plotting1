# read data
power <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

Sys.setlocale("LC_TIME", "C")
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

# plot3
png(filename = "plot3.png",width = 480, height = 480)
with(power, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", ylim=c(0, 38)))
with(subset(power, Sub_metering_1>0), lines(datetime, Sub_metering_1))
with(subset(power, Sub_metering_2>0), lines(datetime, Sub_metering_2, col="red"))
with(subset(power, Sub_metering_3>0), lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1)
dev.off()

