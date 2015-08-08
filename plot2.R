datapath <- "D:/Documentos/Training/Coursera/ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt"
data <- read.table(datapath, sep = ";", header = TRUE, colClasses = "character")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

library(dplyr)
cran <- tbl_df(data)
rm("data")
powerdata <- filter(cran, Date == "2007-02-01" | Date == "2007-02-02")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata2 <- mutate(powerdata, datetime = paste(Date, Time))
powerdata2$datetime <- strptime(powerdata2$datetime, format = "%Y-%m-%d %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(powerdata2, plot(datetime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()
