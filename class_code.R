setwd("~/Documents/hyst_work_direct")
phen<- read.csv(file="hf_data.csv",header=T)
phen
head(phen)
phen$hyst<-(phen$fopn.jd)-(phen$bb.jd)
phen
phen$class<-(phen$hyst)
head(phen)
library(car)
phen$class<-recode(phen$class,"0:hi='No'")
phen
range(phen$class, na.rm=T)
phen$class<-recode(phen$class,"-38:-1='Yes';0:79='No'")
phen$class<-recode(phen$class, "'Yes'=1;'No'=0")
reduced<-data.frame(phen$species,phen$class)
library(dplyr)
tbl_df(reduced)
View(reduced)
group_by(phen,species)


