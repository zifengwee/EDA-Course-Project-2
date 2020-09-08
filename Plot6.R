
setwd("C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2/exdata_data_NEI_data.zip", method = "curl")
unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("~/R/Git/EDA-Course-Project-2/summarySCC_PM25.rds")
SCC <- readRDS("~/R/Git/EDA-Course-Project-2/Source_Classification_Code.rds")

library(ggplot2)

BalNEI <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
LacNEI <- subset(NEI, NEI$fips == "06037" & NEI$type == "ON-ROAD")
BalNEI$city <- "Baltimore City"
LacNEI$city <- "Los Angeles County"
TotalNEI <- rbind(BalNEI, LacNEI)

P6NEI <- ggplot(TotalNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(.~city) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM2.5 Emission Kilo-tons")) + 
  labs(title=expression("PM 2.5 Motor Vehicle Emissions in Baltimore City & Los Angelos County by Year"))
  
print(P6NEI)

AggregateEmissions <- aggregate(Emissions~city+year, data=TotalNEI, sum)
Balchanges <- subset(AggregateEmissions, AggregateEmissions$city=="Baltimore City")
Lacchanges <- subset(AggregateEmissions, AggregateEmissions$city=="Los Angeles County")
max(Balchanges$Emissions) - min(Balchanges$Emissions)
max(Lacchanges$Emissions) - min(Lacchanges$Emissions)

