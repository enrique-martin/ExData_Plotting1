# Import data (you may need to change the working directory)
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")
# Tidying up
library(dplyr)
data <- tbl_df(data)
mydata <- mutate(data, Date=as.character(Date)) %>% 
        filter(Date=="1/2/2007" | Date=="2/2/2007") %>% 
        mutate(Time=as.character(Time))  %>% 
        mutate(DateTime=paste(Date,Time))

# Creating plot to a file in the working directory
png("plot2.png", width=480, height=480)
plot(strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S"),
     mydata$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()