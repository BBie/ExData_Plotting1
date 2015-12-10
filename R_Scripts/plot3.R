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

# Making Plot 3
colors()[grep("gray",colors())]

plot(newdf$Sub_metering_1,type="l",col="darkgray", xlab = "", 
		ylab = "Energy sub metering", axes = FALSE)
axis(side = 1, at=c(1, 1441, 2880), labels=c("Tue", "Wed", "Thu"))
axis(2)
box(col = 'darkgray',lwd = 2)
lines(newdf$Sub_metering_2,col="red")
lines(newdf$Sub_metering_3,col="blue")

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()
