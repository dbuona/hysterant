setwd("~/Documents/hyst_work_direct")
phen<- read.csv(file="hf_data.csv",header=T)
phen
head(phen)
phen$hyst<-(phen$fopn.jd)-(phen$bb.jd)
phen
phen$class<-(phen$hyst)
phen
head(phen)
transform<-
  ##now I am adding to see how git works