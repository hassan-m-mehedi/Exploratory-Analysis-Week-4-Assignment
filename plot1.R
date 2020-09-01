
# Downloading the file

file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(file_url, destfile = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Peer Assessment.zip", method = "curl")



# Unzipping the file
unzip("C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Peer Assessment.zip")


# Loading the library
library(ggplot2)
library(dplyr)



# Loading the data into variables
source_classification_code <- readRDS(file = "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\Source_Classification_Code.rds")
national_emission_inventory <- readRDS(file ="C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Analysis-Week-4-Assignment\\summarySCC_PM25.rds" )



#Preparing the data
national <- merge(national_emission_inventory, source_classification_code, by= "SCC")
national$year <- as.factor(national$year)

#Question 1

national_processed <- tapply(national$Emissions, national$year, sum)
plot1 <- barplot(national_processed,  main = "Fine Particulate Emissions \n Total United States\n", xlab = "Years", ylab =  "amount of pm 2.5 emitted in tons")



# Png File
dev.copy(png, file = "plot1.png")
dev.off()





