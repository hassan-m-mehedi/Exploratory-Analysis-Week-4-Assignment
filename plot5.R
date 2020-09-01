# Loading the library
library(ggplot2)
library(dplyr)



# Loading the data into variables
source_classification_code <- readRDS(file = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Source_Classification_Code.rds")
national_emission_inventory <- readRDS(file ="C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\summarySCC_PM25.rds" )



#Preparing the data
national <- merge(national_emission_inventory, source_classification_code, by= "SCC")
national$year <- as.factor(national$year)

# Question 5

baltimore <- filter(national, fips == "24510")
vehicles_on_road <- filter(baltimore, type == "ON-ROAD")
vehicles_non_road <- filter(baltimore, type == "NON-ROAD")
vehicles <- rbind(vehicles_on_road, vehicles_non_road)

plot_init <- ggplot(vehicles, aes(year, Emissions)) + labs(title= "Fine particulate emissions \n Motor vehicle sources \n Baltimore City")+ xlab("year")+ ylab("amount of pm2.5 emitted, in tons")
plot5 <- plot_init + geom_bar(stat= "identity", fill= "blue")

# Png file
dev.copy(png, file= "plot5.png")
dev,off()