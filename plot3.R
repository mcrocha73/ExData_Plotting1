library(data.table)

file<-fread("household_power_consumption.txt", sep=";", na.strings="?")

filtered_data <-file[file$Date == '1/2/2007' | file$Date == '2/2/2007', ]

filtered_data$Sub_metering_1 = as.numeric(filtered_data$Sub_metering_1[!is.na(filtered_data$Sub_metering_1)])
filtered_data$Sub_metering_2 = as.numeric(filtered_data$Sub_metering_2[!is.na(filtered_data$Sub_metering_2)])
filtered_data$Sub_metering_3 = as.numeric(filtered_data$Sub_metering_3[!is.na(filtered_data$Sub_metering_3)])
filtered_data$datetime = as.POSIXct(paste(as.Date(filtered_data$Date, format("%d/%m/%Y")), filtered_data$Time, sep=" "))

colors_sub_metering<-c("black", "red", "blue")

png(filename="plot3.png")

plot(filtered_data$datetime, filtered_data$Sub_metering_1, col=colors_sub_metering[1], xlab='', ylab='Energy sub metering', type="l")
lines(filtered_data$datetime,filtered_data$Sub_metering_2, col=colors_sub_metering[2])
lines(filtered_data$datetime,filtered_data$Sub_metering_3, col=colors_sub_metering[3])

legend("topright", col=colors_sub_metering, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty='solid')

dev.off()