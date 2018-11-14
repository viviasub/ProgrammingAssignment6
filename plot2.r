setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6")
if (!exists("NEI")) {source("Read_data.R")}

# SECOND PLOT
NEI_Balt=NEI[NEI$fips=="24510",]
year<-as.numeric(levels(NEI_Balt$year))
Sum_Emission<-matrix(ncol=4,nrow=2)
Sum_Emission[1,]<-year
for (i in 1:length(year)) {
        Sum_Emission[2,i]<-sum(NEI_Balt$Emissions[NEI_Balt$year==year[i]])
        
        
}
png("plot2.png", width=480, height=480)

plot(Sum_Emission[1,],Sum_Emission[2,],type="l", axes=FALSE, frame.plot = TRUE,
     main="Baltimore Total Emission PM 2.5",xlim=c(1999,2008),ylim=c(1700,3400), xlab="Year",ylab="Ton",col="red")
axis(1,at=1998:2009)
axis(2)
text_label<-round(Sum_Emission[2,])
points(Sum_Emission[1,],Sum_Emission[2,],pch=19,col="black")
text(Sum_Emission[1,],Sum_Emission[2,],labels=text_label,cex= 1,pos=3)

dev.off()

