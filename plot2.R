################################################################################
#  Coursera:  Exploratory Data Analysis
#  Project Two - Plot 2
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- merge(NEI,SCC)
Year <- c(1999, 2002, 2005, 2008)

# 
par(mar = c(1, 1, 1, 1))
baltPM <- NEI[NEI$fips == "24510",]
totalsBalt <- tapply(baltPM$Emissions, baltPM$year, sum)
plot(Year, totalsBalt,ylab = "Total PM25 Emissions", xlab = "Year", main = "Baltimore PM25 Yearly Totals", pch = 10, col = "blue", cex = 2)
dev.copy(png, "plot2.png")
dev.off()
