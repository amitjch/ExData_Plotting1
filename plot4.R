########################################################################################

# Exploratory Data Analysis - Week 1 - Plot 4

#########################################################################################

#### Init


Sys.setlocale("LC_TIME", "C") #Enable to show the weekdays in English

### Load Data and adjust formats

data <- read.table(file ="household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE)

data$datetime <- strptime(paste0(data$Date," ", data$Time), format ="%d/%m/%Y %H:%M:%S") #Creates a new datetime-Variable
data$Date <- as.Date(data$Date,format="%d/%m/%Y" )
data$Time <- strptime(data$Time, format = "%H:%M:%S")

#Subset Data
data2 <- subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Make Plot 4

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# the first plot
plot(data2$datetime 
     ,data2$Global_active_power 
     ,type = "l"
     ,ylab ="Global Active Power"
     ,xlab =""
)

#the second plot
plot(data2$datetime,data2$Voltage, type = "l", 
   ylab = "Voltage", xlab = "datetime" )

#the third plot
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
#Add Data Submeetering 3
points(data2$datetime
       ,data2$Sub_metering_3
       ,type="l"
       ,col="blue"
)
#Add Legend
legend("topright", lty=1, lwd=2,bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#the fourth plot
plot(data2$datetime, data2$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab ="Global_reacive_power")


## Save the plot
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
