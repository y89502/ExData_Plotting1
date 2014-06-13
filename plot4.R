#import the data from 2007/02/01 00:00:00 to 2007/02/02 23:59
x <- read.csv('household_power_consumption.txt', skip = 66636, nrow =2880, sep = ';', na.string = '?');
#modify the colnames of x
colnames(x) <- colnames(read.csv('household_power_consumption.txt',sep=";",nrow=1));
#Strip the Date Time
xt <- strptime( paste( x$Date, x$Time ,sep = " "), format = '%d/%m/%Y %H:%M:%S');
#create the png file
p1 <- png('plot4.png', width = 480, height = 480);

#set the paramter
par(mfcol = c(2,2));

#make the plot
p1 <- plot(xt,x$Global_active_power,type='l', xlab='',ylab='Global Active Power');
p1 <- plot( xt, x$Sub_metering_1, type = 'l', col ='black',ylab='Energy sub metering',xlab='');
lines( xt, x$Sub_metering_2, type = 'l', col ='red',ylab='',xlab = '');
lines( xt, x$Sub_metering_3, type = 'l', col ='blue',ylab='',xlab = '');
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),ncol=1,lty=1,lwd=2,bty='n',y.intersp=1);
p1 <- plot(xt,x$Voltage,ylab='Voltage',xlab='datetime',lty=1,type='l',lwd=1);
p1 <- plot(xt,x$Global_reactive_power,ylab='Global_reactive_power',xlab='datetime',type='l',lty=1,lwd=1);

#close the file
dev.off()
