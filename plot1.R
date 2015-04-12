# read entire dataset into memory
hpc <- read.csv("household_power_consumption.txt", sep=";")

# get the wanted dates into a separate data frame
feb <- hpc[hpc$"Date" == "1/2/2007" | hpc$"Date" == "2/2/2007",]

# the column we'd like to plot as histogram
global_active_power <- as.numeric(as.vector(feb$"Global_active_power"))

# create png file
png(filename="plot1.png")

# create the histogram
hist(global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",
     col="red")

# write to file
dev.off()
