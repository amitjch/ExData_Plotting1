########################################################################################

# Exploratory Data Analysis - Week 1 - Plot 3

#########################################################################################

#### Init

setwd("C:/Users/kerby/Documents/R_Projects/EDA/ExData_Plotting1")
Sys.setlocale("LC_TIME", "C") #Enable to show the weekdays in English

### Load Data and adjust formats

data <- read.table(file ="household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE)

data$datetime <- strptime(paste0(data$Date," ", data$Time), format ="%d/%m/%Y %H:%M:%S") #Creates a new datetime-Variable
data$Date <- as.Date(data$Date,format="%d/%m/%Y" )
data$Time <- strptime(data$Time, format = "%H:%M:%S")

#Subset Data
data2 <- subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Make Plot 3
par(mfrow = c(1,1)))
plot(data2$datetime 
     ,data2$Sub_metering_1
     ,type = "l"
     ,ylab ="Energy sub metering"
     ,xlab =""
     )
#Add Data Submetering 2
points(data2$datetime 
       ,data2$Sub_metering_2
       ,type="l"
       ,col="red"
       )
#Add Data Submetering 3
points(data2$datetime
       ,data2$Sub_metering_3
       ,type="l"
       ,col="blue"
        )
#Add Legend
legend("topright", lty=1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


## Save the plot
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
