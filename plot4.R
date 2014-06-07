
#import the data
x <- read.csv('household_power_consumption.txt', sep = ';', na.string = '?');

#format the Date
x$Date <- as.Date(x$Date, format = '%d/%m/%Y');

#subset the data from 2007-02-01 to 2007-02-02
y <- subset(x, '2007-01-31'< x$Date & x$Date <'2007-02-03');

#formate the Time
y$Time <- strptime( paste( y$Date, y$Time, sep=' '), format = '%Y-%m-%d %H:%M:%S');

#reset the rownames
rownames(y) <- c(1:2880)

#create the png file
p1 <- png('plot4.png', width = 480, height = 480);

#find the range of sub1, sub2, and sub3
rg <- range(c(y$Sub_metering_1,y$Sub_metering_2,y$Sub_metering_3));

#set the paramter
par(mfcol = c(2,2));

#make the plot
p1 <- plot(y$Time,y$Global_active_power,type='l', xlab='',ylab='Global Active Power');
p1 <- plot(y$Time, y$Sub_metering_1, type = 'l', col ='black',ylab='Energy sub metering',xlab='',ylim =rg);
par(new=TRUE);
p1 <- plot(y$Time, y$Sub_metering_2, type = 'l', col ='red',ylab='',xlab = '',axes=FALSE,ylim =rg);
par(new=TRUE);
p1 <- plot(y$Time, y$Sub_metering_3, type = 'l', col ='blue',ylab='',xlab = '',axes=FALSE,ylim =rg);
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),ncol=1,lty=1,lwd=1,bty='n',y.intersp=1);
p1 <- plot(y$Time,y$Voltage,ylab='Voltage',xlab='datetime',lty=1,type='l',lwd=1);
p1 <- plot(y$Time,y$Global_reactive_power,ylab='Global_reactive_power',xlab='datetime',type='l',lty=1,lwd=1);

#close the file
dev.off()
