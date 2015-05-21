################################################################################
#  Coursera:  Exploratory Data Analysis
#  Project Two - Plot 6
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- merge(NEI,SCC)
Year <- c(1999, 2002, 2005, 2008)

# Baltimore Data
baltPM <- NEI[NEI$fips == "24510",]
baltVeh <- baltPM[grepl("Veh", baltPM$Short.Name) & baltPM$type == "ON-ROAD",]
totalsBaltVeh <- tapply(baltVeh$Emissions, baltVeh$year, sum)

#LA Data
laPM <- NEI[NEI$fips == "06037",]
laVeh <- laPM[grepl("Veh", laPM$Short.Name) & laPM$type == "ON-ROAD",]
totalslaVeh <- tapply(laVeh$Emissions, laVeh$year, sum)


par(mfrow = c(1, 2), mar = c(4, 4, 2, 1), oma = c(0,0,2,0))
plot(Year, totalsBaltVeh, ylab = "Total PM25 Emissions", xlab = "Year", main = "Baltimore PM25", pch = 10, col = "blue", cex = 2)
plot(Year, totalslaVeh, ylab = "Total PM25 Emissions", xlab = "Year", main = "Los Angeles PM25", pch = 10, col = "blue", cex = 2)
mtext("Baltimore and Los Angeles Motor Vehicle Emissions Trends (1999 to 2008)", outer = TRUE)
dev.copy(png, "plot6.png")
dev.off()
