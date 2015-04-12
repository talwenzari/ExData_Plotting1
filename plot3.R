# read entire dataset into memory
hpc <- read.csv("household_power_consumption.txt", sep=";")

# get the wanted dates into a separate data frame
feb <- hpc[hpc$"Date" == "1/2/2007" | hpc$"Date" == "2/2/2007",]

# x axis variable
dates <- strptime(paste(feb[,1],feb[,2]),"%d/%m/%Y %H:%M:%S")

# init png file
png("plot3.png")

# init plot
plot(dates,
     as.vector(feb$"Sub_metering_1"),
     type="n",
     xlab="",
     ylab="Energy sub metering",
)

# draw lines one by one
lines(dates,as.vector(feb$"Sub_metering_1"),col = "black")
lines(dates,as.vector(feb$"Sub_metering_2"),col = "red")
lines(dates,as.vector(feb$"Sub_metering_3"),col = "blue")

# draw legend box
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"),
       lty=1)

# write to file
dev.off()