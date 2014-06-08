# read data
power <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]
power$Global_active_power <- as.numeric(power$Global_active_power)

Sys.setlocale("LC_TIME", "C")
power$datetime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

# plot2
png(filename = "plot2.png",width = 480, height = 480)
with(power, plot(datetime, Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()


