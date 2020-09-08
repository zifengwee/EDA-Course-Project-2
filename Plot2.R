
setwd("C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2/exdata_data_NEI_data.zip", method = "curl")
unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("~/R/Git/EDA-Course-Project-2/summarySCC_PM25.rds")
SCC <- readRDS("~/R/Git/EDA-Course-Project-2/Source_Classification_Code.rds")

P2NEI <- subset(NEI, NEI$fips == "24510")
P2NEI <- aggregate(Emissions ~ year, P2NEI, sum)
barplot(
  (P2NEI$Emissions)/10^6,
  names.arg=P2NEI$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From Baltimore City"
  )
