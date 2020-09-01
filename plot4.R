# Loading the library
library(ggplot2)
library(dplyr)



# Loading the data into variables
source_classification_code <- readRDS(file = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Source_Classification_Code.rds")
national_emission_inventory <- readRDS(file ="C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\summarySCC_PM25.rds" )



#Preparing the data
national <- merge(national_emission_inventory, source_classification_code, by= "SCC")
national$year <- as.factor(national$year)

# Question 4
coal <- filter(national, grepl("Coal", EI.Sector))
plot_init <- ggplot(coal, aes(year, Emissions)) + labs(title= "Fine particulate emission \n Coal combustion related sources \n Total United States \n") +xlab("Years") + ylab("amount of pm2.5 emitted, in tons")
plot4 <- plot_init+ geom_bar(stat= "identity", fill= "brown")
 
# png file
dev.copy(png, file= "plot4.png")
dev.off()
