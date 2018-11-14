setwd("~/Progetti_R/progetti_r_new/script_vecchi_tutorial/ProgrammingAssignment6")
if (!exists("NEI")) {source("Read_data.R")}

# FOURTH PLOT
tmp_2<-as.factor(grep("Coal",SCC$EI.Sector,value = TRUE))
tmp_2<- levels(as.factor(tmp_2))
Coal<-NULL
for (i in 1:length(tmp_2)) {
        tmp<-as.character(SCC$SCC[SCC$EI.Sector==tmp_2[i]])
        Coal<-c(Coal,tmp)
}

NEI_Coal=NULL
for (i in 1:length(Coal)) {
        tmp=NEI[NEI$SCC==Coal[i],]
        NEI_Coal<-rbind(NEI_Coal,tmp)
        }

rm(tmp,tmp_2,Coal)

year<-as.numeric(levels(NEI_Coal$year))
Sum_Emission<-matrix(ncol=4,nrow=2)
Sum_Emission[1,]<-year
for (i in 1:length(year)) {
        Sum_Emission[2,i]<-sum(NEI_Coal$Emissions[NEI_Coal$year==year[i]])
        }
png("plot4.png", width=480, height=480)

plot(Sum_Emission[1,],Sum_Emission[2,],type="l", axes=FALSE, frame.plot = TRUE,
     main="Coal Total Emission PM 2.5",xlim=c(1999,2008),ylim=c(340000,600000), xlab="Year",ylab="Ton",col="Red")
axis(1,at=1999:2008)
axis(2)
points(Sum_Emission[1,],Sum_Emission[2,],pch=19,col="black")
text_label<-round(Sum_Emission[2,])
text(Sum_Emission[1,],Sum_Emission[2,],labels=text_label,cex= 1,pos=3)
dev.off()


