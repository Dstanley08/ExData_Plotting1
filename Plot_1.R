#read in whole data set
household_power_consumption <- read.csv("D:/JHU Data Science Program/Course 4 Exploratory Data Analysis/Week 1/Week 1 Course Project/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")

# Change Date Format
household_power_consumption$V1 <- format(as.Date(household_power_consumption$V1, format = "%d/%m/%Y"), "%Y-%m-%d")
# Subset the required dates:
date1 <- as.Date("2007-02-01")
date2<- as.Date("2007-02-02")
date_subset <- household_power_consumption[household_power_consumption$V1 >= date1 & household_power_consumption$V1 <= date2,]
#subset the Global Active Power (kilowatts) to be used in the histogram
plot1_values=date_subset$V3
#convert to numeric values to be used in the histogram
plot1_values=as.numeric(as.character(plot1_values))
#Remove the "NA" in the first row
plot1_values=plot1_values[!is.na(plot1_values)]
#create histogram and save to a .png file
library(ggplot2)
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(plot1_values,col="red",xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()
