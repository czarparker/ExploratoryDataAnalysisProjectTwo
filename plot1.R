################################################################################
#  Coursera:  Exploratory Data Analysis
#  Project Two - Plot 1
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#


NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- merge(NEI,SCC)
Year <- c(1999, 2002, 2005, 2008)

# 
totals <- tapply(NEI$Emissions, NEI$year, sum)
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
plot(Year, totals, ylab = "Total PM25 Emissions", xlab = "Year", main = "PM25 Yearly Totals", pch = 10, col = "blue", cex = 2)
dev.copy(png, "plot1.png")
dev.off()