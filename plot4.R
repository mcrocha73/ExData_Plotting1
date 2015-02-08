library(data.table)

file<-fread("household_power_consumption.txt", sep=";", na.strings="?")

filtered_data <-file[file$Date == '1/2/2007' | file$Date == '2/2/2007', ]

filtered_data$Global_active_power<-as.numeric(filtered_data$Global_active_power[!is.na(filtered_data$Global_active_power)])
filtered_data$datetime<-as.POSIXct(paste(as.Date(filtered_data$Date, format("%d/%m/%Y")), filtered_data$Time, sep=" "))
filtered_data$Voltage<-as.numeric(filtered_data$Voltage[!is.na(filtered_data$Voltage)])
filtered_data$Global_reactive_power<-as.numeric(filtered_data$Global_reactive_power[!is.na(filtered_data$Global_reactive_power)])

png(filename="plot4.png")
par(mfcol=c(2,2))

#
plot(filtered_data$datetime, filtered_data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#
colors_sub_metering<-c("black", "red", "blue")
plot(filtered_data$datetime, filtered_data$Sub_metering_1, col=colors_sub_metering[1], xlab='', ylab='Energy sub metering', type="l")
lines(filtered_data$datetime,filtered_data$Sub_metering_2, col=colors_sub_metering[2])
lines(filtered_data$datetime,filtered_data$Sub_metering_3, col=colors_sub_metering[3])

legend("topright", col=colors_sub_metering, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty='solid')

#
plot(filtered_data$datetime, filtered_data$Voltage, xlab="datetime", ylab="Voltage", type="l")

#
plot(filtered_data$datetime, filtered_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()