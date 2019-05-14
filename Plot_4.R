#read in whole data set
household_power_consumption <- read.csv("D:/JHU Data Science Program/Course 4 Exploratory Data Analysis/Week 1/Week 1 Course Project/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")

# Change Date Format
household_power_consumption$V1 <- format(as.Date(household_power_consumption$V1, format = "%d/%m/%Y"), "%Y-%m-%d")
# Subset the required dates:
date1 <- as.Date("2007-02-01")
date2<- as.Date("2007-02-02")
date_subset <- household_power_consumption[household_power_consumption$V1 >= date1 & household_power_consumption$V1 <= date2,]
#create a new column with values of combined date and time
date_subset$newcol <- paste(date_subset$V1, date_subset$V2, sep="")

#subset the Global Active Power (kilowatts) to be used in the histogram

x_values=date_subset$newcol
y_values=date_subset$V3
y_values2=date_subset$V5
y_values3=date_subset$V7
y_values4=date_subset$V8
y_values5=date_subset$V9
y_values6=date_subset$V4

#convert date/time to a useable format
x_values=strptime(date_subset$newcol, "%Y-%m-%d %H:%M:%S")

#convert to numeric values to be used in the plots
y_values=as.numeric(as.character(y_values))
y_values2=as.numeric(as.character(y_values2))
y_values3=as.numeric(as.character(y_values3))
y_values4=as.numeric(as.character(y_values4))
y_values5=as.numeric(as.character(y_values5))
y_values6=as.numeric(as.character(y_values6))

#Remove the "NA" in the first row
x_values=x_values[!is.na(x_values)]
y_values=y_values[!is.na(y_values)]
y_values2=y_values2[!is.na(y_values2)]
y_values3=y_values3[!is.na(y_values3)]
y_values4=y_values4[!is.na(y_values4)]
y_values5=y_values5[!is.na(y_values5)]
y_values6=y_values6[!is.na(y_values6)]


#create plot and save to a .png file
library(ggplot2)
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
#
par(mfrow=c(2,2))
plot(x_values,y_values,type='l',ylab='Global Active Power (kilowatts)',xlab='',pch=20)
plot(x_values,y_values2,type='l',ylab='Voltage',xlab='datetime',pch=20)
plot(x_values,y_values3,type='l',col='black',xlab="",ylab="Energy sub metering")
lines(x_values,y_values4,type='l',col='red')
lines(x_values,y_values5,type='l',col='blue')
legend('topright',c('sub_metering_1','sub_metering_2','sub_metering_3'),lty=1,col=c('black','red','blue'),bty='n',cex=.75)

plot(x_values,y_values6,type='l',ylab='Global_reactive_power',xlab='datetime',pch=20)

#
dev.off()
