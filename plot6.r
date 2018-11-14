setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6")
if (!exists("NEI")) {source("Read_data.R")}

# SIX PLOT
NEI_Balt=NEI[NEI$fips=="24510",]
NEI_Balt=NEI_Balt[NEI_Balt$type=='ON-ROAD',]

NEI_LosA=NEI[NEI$fips=="06037",]
NEI_LosA=NEI_LosA[NEI_LosA$type=='ON-ROAD',]

year<-as.numeric(levels(NEI_Balt$year))
Sum_Emission<-matrix(ncol=4,nrow=3)
Sum_Emission[1,]<-year
for (i in 1:length(year)) {
        Sum_Emission[2,i]<-sum(NEI_Balt$Emissions[NEI_Balt$year==year[i]])
        }

for (i in 1:length(year)) {
  Sum_Emission[3,i]<-sum(NEI_LosA$Emissions[NEI_LosA$year==year[i]])
  
  
}

row.names(Sum_Emission)<-c("Year","Baltimore","LosAngeles")

png("plot6.png", width=480, height=480)

plot(Sum_Emission[1,],Sum_Emission[2,],type="l", axes=FALSE,
        frame.plot = TRUE,main="Motor Emission PM 2.5",
        ylim=c(0,4700),xlab="Year",ylab="Ton",col="Red")
        axis(1,at=1999:2008)
        axis(2)
        
        text_label<-round(Sum_Emission[2,])
        points(Sum_Emission[1,],Sum_Emission[2,],pch=19,col="black")
        text(Sum_Emission[1,],Sum_Emission[2,], labels=text_label,cex= 1,pos=1)

        lines(Sum_Emission[1,],Sum_Emission[3,],col="blue")
        text_label<-round(Sum_Emission[3,])

        points(Sum_Emission[1,],Sum_Emission[3,],pch=19,col="black")
        text(Sum_Emission[1,],Sum_Emission[3,], labels=text_label,cex= 1,pos=1)

        legend(2003,2500, legend=c("Los Angeles", "Baltimore"),
                col=c("blue", "red"), lty=1, cex=0.8)

dev.off()

rm(text_label,Sum_Emission,year,i,type)

