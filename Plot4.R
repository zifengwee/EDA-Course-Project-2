
setwd("C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "C:/Users/Wee Zi Feng/Documents/R/Git/EDA-Course-Project-2/exdata_data_NEI_data.zip", method = "curl")
unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("~/R/Git/EDA-Course-Project-2/summarySCC_PM25.rds")
SCC <- readRDS("~/R/Git/EDA-Course-Project-2/Source_Classification_Code.rds")

library(ggplot2)

combdata <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coaldata <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalcombdata <- (combdata & coaldata)
combSCC <- SCC[coalcombdata,]$SCC
coalcombNEI <- NEI[NEI$SCC %in% combSCC,]

P4NEI <- ggplot(coalcombNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM 2.5 Emission (10^5 Tons)")) + 
  labs(title=expression("PM 2.5 Coal Combustion Source Emissions in US by Year"))

print(P4NEI)
