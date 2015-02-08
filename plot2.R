library(data.table)

file<-fread("household_power_consumption.txt", sep=";", na.strings="?")

filtered_data <-file[file$Date == '1/2/2007' | file$Date == '2/2/2007', ]

filtered_data$Global_active_power<-as.numeric(filtered_data$Global_active_power[!is.na(filtered_data$Global_active_power)])
filtered_data$datetime = as.POSIXct(paste(as.Date(filtered_data$Date, format("%d/%m/%Y")), filtered_data$Time, sep=" "))

png(filename="plot2.png")

plot(filtered_data$datetime, filtered_data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()