################################################################################
#  Coursera:  Exploratory Data Analysis
#  Project  - Plot 3
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- merge(NEI,SCC)
Year <- c(1999, 2002, 2005, 2008)


library(dplyr)

baltPM <- NEI[NEI$fips == "24510",]
totalsBaltType <- baltPM %>% group_by (year, type) %>% summarise(sum(Emissions))
colnames(totalsBaltType) <- c("Year", "Type", "Emissions")

qplot(x = Year, y = Emissions, data = totalsBaltType, facets = . ~ Type)

dev.copy(png, "plot3.png")
dev.off()
