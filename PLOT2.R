
df<-read.table("household_power_consumption.txt",sep=";", header=TRUE)
df$Date2<-strptime(df$Date,format = "%d/%m/%Y")
df<-subset(df,Date2=="2007-02-01"|Date2=="2007-02-02")
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Global_active_power<-as.numeric(paste(df$Global_active_power))
with(df,plot(DateTime,Global_active_power,type="l",ylab ="Global Active Power",xlab = ""))
dev.copy(png, file = "PLOT2.png")
dev.off()