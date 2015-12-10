# Loading data

# Data seperated by ";"
# missing values are coded as ?
# use rep(x, ntimes) to repeat type 'character' 2 times, type 'numeric' 7 times
variable.class<-c(rep('character',2),rep('numeric',7))
df <- read.table("household_power_consumption.txt",header=T,
				sep=';',na.strings='?',colClasses=variable.class)  # read text file 
head(df)

# subset data based on variable values: select data from the dates 2007-02-01 and 2007-02-02
newdf <- subset(df, Date=='1/2/2007' | Date=='2/2/2007')
nrow(newdf)
head(newdf)

# Making Plot 4

## draw four plots
par(mfrow = c(2,2)) 

## draw 1st plot
plot(newdf$Global_active_power, xlab = "", ylab = "Global Active Power", 
		type="l", lwd = 2, axes = FALSE)
axis(side = 1, at=c(1, 1441, 2880), labels=c("Tue", "Wed", "Thu"))
axis(2)
box(col = 'darkgray', lwd = 2)

## draw 2nd plot
plot(newdf$Voltage, xlab = "datetime", ylab = "Voltage", type="l", lwd = 2, axes = FALSE)
axis(side = 1, at=c(1, 1441, 2880), labels=c("Tue", "Wed", "Thu"))
axis(2)
box(col = 'darkgray', lwd = 2)

## draw 3rd plot
plot(newdf$Sub_metering_1,type="l",col="darkgray", xlab = "", 
		ylab = "Energy sub metering", axes = FALSE)
axis(side = 1, at=c(1, 1441, 2880), labels=c("Tue", "Wed", "Thu"))
axis(2)
box(col = 'darkgray', lwd = 2)
lines(newdf$Sub_metering_2,col="red")
lines(newdf$Sub_metering_3,col="blue")

## draw 4th plot
plot(newdf$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", 
		type="l",lwd = 2, axes = FALSE)
axis(side = 1, at=c(1, 1441, 2880), labels=c("Tue", "Wed", "Thu"))
axis(2)
box(col = 'darkgray', lwd = 2)

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480) 
dev.off()
