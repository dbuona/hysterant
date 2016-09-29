setwd("~/Documents/hyst_work_direct")
phen<- read.csv(file="Acer_small.csv",header=T)
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
phen
reduced<-data.frame(phen$species,phen$class)
library(dplyr)
tbl_df(reduced)
View(reduced)
group_by(phen,species)
ace_rubl<-subset(phen, subset=species=="ACRU")
ace_penl<-subset(phen, subset=species=="ACPE")
ace_penl
ace_rubl
mean(ace_rubl$bb.jd)
t.test(ace_penl$bb.jd,mu=125.68)
