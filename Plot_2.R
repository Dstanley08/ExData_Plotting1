#read in whole data set
household_power_consumption <- read.csv("D:/JHU Data Science Program/Course 4 Exploratory Data Analysis/Week 1/Week 1 Course Project/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")

# Change Date Format
household_power_consumption$V1 <- format(as.Date(household_power_consumption$V1, format = "%d/%m/%Y"), "%Y-%m-%d")
# Subset the required dates:
date1 <- as.Date("2007-02-01")
date2<- as.Date("2007-02-02")
date_subset <- household_power_consumption[household_power_consumption$V1 >= date1 & household_power_consumption$V1 <= date2,]
#create a new column with values of combined date and time
date_subset$newcol <- paste(date_subset$V1, date_subset$V2, sep=" ")

#subset the Global Active Power (kilowatts) to be used in the histogram
y_values=date_subset$V3
x_values=date_subset$newcol
#convert date/time to a useable format
x_values=strptime(date_subset$newcol, "%Y-%m-%d %H:%M:%S")
#convert to numeric values to be used in the histogram
y_values=as.numeric(as.character(y_values))

#Remove the "NA" in the first row
x_values=x_values[!is.na(x_values)]
y_values=y_values[!is.na(y_values)]


#create plot and save to a .png file
library(ggplot2)
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(x_values,y_values,type='l',ylab='Global Active Power (kilowatts)',xlab='')
dev.off()
