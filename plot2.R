# read entire dataset into memory
hpc <- read.csv("household_power_consumption.txt", sep=";")

# get the wanted dates into a separate data frame
feb <- hpc[hpc$"Date" == "1/2/2007" | hpc$"Date" == "2/2/2007",]

# the y axis variable
global_active_power <- as.numeric(as.vector(feb$"Global_active_power"))

# x axis variable
dates <- strptime(paste(feb[,1],feb[,2]),"%d/%m/%Y %H:%M:%S")

# create plot
png("plot2.png")

# draw empty plot
plot(dates, 
     global_active_power,
     type = "n", 
     xlab="", 
     ylab = "Global Active Power (kilowatts)")

# draw lines
lines(dates, global_active_power)

# write to file
dev.off()