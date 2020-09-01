# Loading the library
library(ggplot2)
library(dplyr)



# Loading the data into variables
source_classification_code <- readRDS(file = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Source_Classification_Code.rds")
national_emission_inventory <- readRDS(file ="C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\summarySCC_PM25.rds" )



#Preparing the data
national <- merge(national_emission_inventory, source_classification_code, by= "SCC")
national$year <- as.factor(national$year)

# Question 6
baltimore_losangeles <- filter(national, fips == "24510" | fips == "06037")
vehicles_onroad <- filter(baltimore_losangeles, type == "ON-ROAD")
vehicles_nonroad <- filter(baltimore_losangeles, type == "NON-ROAD")
vehicles <- rbind(vehicles_onroad, vehicles_nonroad)
vehicles$fips <- gsub("24510", "Baltimore", vehicles$fips)
vehicles$fips <- gsub("06037", "Los Angeles", vehicles$fips)

plot_init <- ggplot(vehicles, aes(year, Emissions)) + labs(title = "Comparison value emissions") + ylab("Amount of emissions")
plot6 <- plot_init + geom_bar(stat= "identity", fill= "blue") 

# Png file
dev.copy(png, file= "plot6.png")
dev.off()
