# Loading the library
library(ggplot2)
library(dplyr)



# Loading the data into variables
source_classification_code <- readRDS(file = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Source_Classification_Code.rds")
national_emission_inventory <- readRDS(file ="C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\summarySCC_PM25.rds" )



#Preparing the data
national <- merge(national_emission_inventory, source_classification_code, by= "SCC")
national$year <- as.factor(national$year)


# Question 3
baltimore_city <- filter(national, fips== "24510")
plot_init <- ggplot(baltimore_city, aes(year, Emissions)) + labs(title= "Fine Particuate Emissions \n Baltimore City, Maryland \n")+ xlab("")+ylab("amount of pm2.5 emitted in tons") 
plot3 <- plot_init + geom_bar(stat = "identity", fill= "blue") 

# Png file
dev.copy(png, file= "plot3.png")
dev.off()