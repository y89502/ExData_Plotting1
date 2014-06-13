
#import the data
x <- read.csv('household_power_consumption.txt', skip=66636, nrow=2880, sep = ';', na.string = '?');
colnames(x) <- colnames( read.csv('household_power_consumption.txt',nrow=1,sep=';') )
#format the Date
xt <- strptime( paste( x$Date, x$Time ), format = '%d/%m/%Y %H:%M:%S');
#create the png file
p1 <- png('plot2.png', width = 480, height = 480);
#make the plot
p1 <- plot(xt,x$Global_active_power,type='l', xlab='',ylab='Global Active Power (kilowatts)');
#p1 <- axis(2,at = c(0,2,4,6))
#close the png file
dev.off()

