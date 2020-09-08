
setwd("C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2/exdata_data_NEI_data.zip", method = "curl")
unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("~/R/Git/EDA-Course-Project-2/summarySCC_PM25.rds")
SCC <- readRDS("~/R/Git/EDA-Course-Project-2/Source_Classification_Code.rds")

library(ggplot2)

P5data <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
P5data <- aggregate(Emissions ~ year, P5data, sum)

P5NEI <- ggplot(P5data,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM 2.5 Emission (10^5 Tons)")) + 
  labs(title=expression("PM 2.5 Motor Vehicle Emissions in Baltimore City by Year"))

print(P5NEI)
