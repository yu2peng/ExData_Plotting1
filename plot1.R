# read data
power <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]
power$Global_active_power <- as.numeric(power$Global_active_power)

# plot1
png(filename = "plot1.png",width = 480, height = 480)
hist(power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()


