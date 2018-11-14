setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6")
if (!exists("NEI")) {source("Read_data.R")}

# THIRD PLOT
NEI_Balt=NEI[NEI$fips=="24510",]
year<-as.numeric(levels(NEI$year))
tmp<-NULL
for(i in 1:length(year)){tmp<-c(tmp,rep(year[i],4))}
year<-tmp

type<-as.factor(rep(levels(NEI$type),4))

Sum_Emission<-matrix(ncol=3,nrow=16)
Sum_Emission<-as.data.frame(Sum_Emission)
Sum_Emission[,1]<-year
Sum_Emission[,2]<-type
rm(tmp)
for (i in 1:length(year)) {
        Sum_Emission[i,3]<-sum(NEI_Balt$Emissions[NEI_Balt$year==year[i] & NEI_Balt$type==type[i]]  )
        }
names(Sum_Emission)<-c("Year","Type","Value")
       
png("plot3.png", width=480, height=480)

library(ggplot2)

g=ggplot(Sum_Emission,aes(Year,Value))
g+geom_point()+facet_grid(.~Type)

dev.off()
rm(g)
