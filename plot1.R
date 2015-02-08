library(data.table)

file<-fread("household_power_consumption.txt", sep=";", na.strings="?")

filtered_data <-file[file$Date == '1/2/2007' | file$Date == '2/2/2007', ]

filtered_data$Global_active_power<-as.numeric(filtered_data$Global_active_power[!is.na(filtered_data$Global_active_power)])

png(filename="plot1.png")

hist(filtered_data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main = paste("Global Active Power"))

dev.off()