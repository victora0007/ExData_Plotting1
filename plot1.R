datapath <- "D:/Documentos/Training/Coursera/ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt"
data <- read.table(datapath, sep = ";", header = TRUE, colClasses = "character")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

library(dplyr)
cran <- tbl_df(data)
rm("data")
powerdata <- filter(cran, Date >= "2007-02-01", Date < "2007-02-03")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(powerdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
