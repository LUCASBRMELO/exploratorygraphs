setwd("C:/Users/lbrag/Desktop/R_Tutotials/exdata_data_household_power_consumption/exploratorygraphs")
df<-read.table("household_power_consumption.txt",sep=";", header=TRUE)
df$Date2<-strptime(df$Date,format = "%d/%m/%Y")
df<-subset(df,Date2=="2007-02-01"|Date2=="2007-02-02")
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Global_active_power<-as.numeric(paste(df$Global_active_power))
df$Sub_metering_1<-as.numeric(paste(df$Sub_metering_1))
df$Sub_metering_2<-as.numeric(paste(df$Sub_metering_2))
df$Sub_metering_3<-as.numeric(paste(df$Sub_metering_3))
plot(df$DateTime, df$Sub_metering_1, type="l", ylab = "Energy sub metering",xlab = " ")

lines(df$DateTime,df$Sub_metering_2, type = "l", col = "red")

lines(df$DateTime,df$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file = "PLOT3.png")
dev.off()