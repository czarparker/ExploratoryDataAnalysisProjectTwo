################################################################################
#  Coursera:  Exploratory Data Analysis
#  Project Two - Plot 4
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- merge(NEI,SCC)
Year <- c(1999, 2002, 2005, 2008)

# 
coalNEI <- NEI[grepl("Coal", NEI$Short.Name) & grepl("Comb", NEI$Short.Name),]
totalsCoal <- tapply(coalNEI$Emissions, coalNEI$year, sum)
plot(Year, totalsCoal,ylab = "Total PM25 Emissions", xlab = "Year", main = "PM25 Yearly Totals (Coal Combustion-Related Sources)", pch = 10, col = "blue", cex = 2)
dev.copy(png, "plot4.png")
dev.off()