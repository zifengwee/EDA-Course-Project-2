
setwd("C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2/exdata_data_NEI_data.zip", method = "curl")
unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("~/R/Git/EDA-Course-Project-2/summarySCC_PM25.rds")
SCC <- readRDS("~/R/Git/EDA-Course-Project-2/Source_Classification_Code.rds")

library(ggplot2)

P3NEI <- subset(NEI, NEI$fips == "24510")

P3NEI <- ggplot(P3NEI, aes(factor(year), Emissions, fill=type))+
  geom_bar(stat = "identity") +
  guides(fill=FALSE) +
  facet_grid(.~type,scales = "free", space = "free") +
  labs(x="year", y=expression("Total PM2.5 Emissions (Tons)"))+
  labs(title = expression("Total PM2.5 Emissions From Baltimore City by Year by Type"))
print(P3NEI)
