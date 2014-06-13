
#import the data
x <- read.csv('household_power_consumption.txt', skip =66636, nrow = 2880, sep = ';', na.string = '?');
colnames(x) <- colnames(read.csv('household_power_consumption.txt',nrow=1,sep=';'));
#create the png file
p1 <- png('plot1.png', width = 480, height = 480);
p1 <- hist(x$Global_active_power,main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red');
p1 <- axis(1, at = c(0,2,4,6));
p1 <- axis(2, at = seq(0,1200,200));
dev.off()

