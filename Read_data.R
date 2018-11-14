rm(list = ls())
try(dev.off())
dev.set(2)
plot.new()
shell("cls")


## SET working dir 
work_dir<-"~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6"
if(!file.exists(work_dir)){dir.create(work_dir)}
setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6")
if(!file.exists("data")){dir.create("data")}
setwd("./data")


## GET DATA
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
file_name<-"FNEI_data.zip"
file_name2<-"summarySCC_PM25.rds"
if(!file.exists(file_name)){download.file(url, destfile = file_name)}
list.files(pattern = )
if(!file.exists(file_name2) ){unzip(file_name)}


## READ DATA 
rm(list = ls())
shell("cls")

##library(dplyr)
print("READING DATA wait .....")
NEI <- readRDS("summarySCC_PM25.rds")
class(NEI)
head(NEI,5)
SCC <- readRDS("Source_Classification_Code.rds")
class(SCC)
names(SCC)


## SET VAriable to FACTOR
NEI$fips<-as.factor(NEI$fips)
NEI$SCC<-as.factor(NEI$SCC)
NEI$Pollutant<-as.factor(NEI$Pollutant)
NEI$year<-as.factor(NEI$year)
NEI$type<-as.factor(NEI$type)


setwd("..")
