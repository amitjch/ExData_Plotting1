########################################################################################

# Exploratory Data Analysis - Week 1 - Plot 1

#########################################################################################

#### Init


Sys.setlocale("LC_TIME", "C") #Enable to show the weekdays in English

### Load Data and ajust formats

data <- read.table(file ="household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE)

data$datetime <- strptime(paste0(data$Date," ", data$Time), format ="%d/%m/%Y %H:%M:%S") #Creates a new datetime-Variable
data$Date <- as.Date(data$Date,format="%d/%m/%Y" )
data$Time <- strptime(data$Time, format = "%H:%M:%S")

#Subset Data
data2 <- subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Make Plot 1
par(mfrow = c(1,1)))
hist(data2$Global_active_power 
     ,main = "Global Active Power" 
     ,col = "Red" 
     ,xlab ="Global Active Power (kilowatts)"
     ,ylab ="Frequency"
     )


# Save the plot
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
