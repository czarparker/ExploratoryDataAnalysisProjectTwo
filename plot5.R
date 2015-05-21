################################################################################
#  Coursera:  Exploratory Data Analysis
#  Project Two - Plot 5
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- merge(NEI,SCC)
Year <- c(1999, 2002, 2005, 2008)

# 
baltPM <- NEI[NEI$fips == "24510",]
baltVeh <- baltPM[grepl("Veh", baltPM$Short.Name) & baltPM$type == "ON-ROAD",]
totalsBaltVeh <- tapply(baltVeh$Emissions, baltVeh$year, sum)
plot(Year, totalsBaltVeh, ylab = "Total PM25 Emissions", xlab = "Year", main = "Baltimore PM25 Yearly Totals (Motor Vehicle Sources)", pch = 10, col = "blue", cex = 2)
dev.copy(png, "plot5.png")
dev.off()
