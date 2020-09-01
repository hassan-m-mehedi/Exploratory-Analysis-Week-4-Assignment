
# Loading the library
library(ggplot2)
library(dplyr)



# Loading the data into variables
source_classification_code <- readRDS(file = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Source_Classification_Code.rds")
national_emission_inventory <- readRDS(file ="C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\summarySCC_PM25.rds" )



#Preparing the data
national <- merge(national_emission_inventory, source_classification_code, by= "SCC")
national$year <- as.factor(national$year)


# Question 2
baltimore_city <- filter(national, fips== "24510")
baltimore_city_processed <- tapply(baltimore_city$Emissions, baltimore_city$year, sum)
plot2 <- barplot(baltimore_city_processed, main = "Fine Particulate Emissions \n Baltimore City, Maryland\n", xlab = "Years", ylab =  "amount of pm 2.5 emitted in tons")



# Png file
dev.copy(png, file = "plot2.png")
dev.off()