setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6")
if (!exists("NEI")) {source("Read_data.R")}

# FIFTH PLOT
NEI_Balt=NEI[NEI$fips=="24510",]
NEI_Balt=NEI_Balt[NEI_Balt$type=='ON-ROAD',]
year<-as.numeric(levels(NEI_Balt$year))
Sum_Emission<-matrix(ncol=4,nrow=2)
Sum_Emission[1,]<-year
for (i in 1:length(year)) {
        Sum_Emission[2,i]<-sum(NEI_Balt$Emissions[NEI_Balt$year==year[i]])
        }

png("plot5.png", width=480, height=480)

plot(Sum_Emission[1,],Sum_Emission[2,],type="l", axes=FALSE, frame.plot = TRUE,
     main="Baltimore Motor Emission PM 2.5",ylim=c(50,350) ,xlab="Year",ylab="Ton",col="Red")
axis(1,at=1999:2008)
axis(2)
text_label<-round(Sum_Emission[2,])
points(Sum_Emission[1,],Sum_Emission[2,],pch=19,col="black")
text(Sum_Emission[1,],Sum_Emission[2,], labels=text_label,cex= 1,pos=1)

dev.off()

