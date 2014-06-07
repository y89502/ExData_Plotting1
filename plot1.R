
#import the data
x <- read.csv('household_power_consumption.txt', sep = ';', na.string = '?');

#format the Date
x$Date <- as.Date(x$Date, format = '%d/%m/%Y');

#subset the data from 2007-02-01 to 2007-02-02
y <- subset(x, '2007-01-31'< x$Date & x$Date <'2007-02-03');

#formate the Time
y$Time <- strptime( paste( y$Date, y$Time, sep=' '), format = '%Y-%m-%d %H:%M:%S');

#create the png file
p1 <- png('plot1.png', width = 480, height = 480);
p1 <- hist(y$Global_active_power,main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red');
dev.off()

