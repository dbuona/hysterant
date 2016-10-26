
## Obtained Pep725 data, extremely unclean
## 26 October 2016 adpoted from Cat's code "bb.leafout.R"
# This script aims to seperate my data into usable columns and merge datasheets

# Clear workspace
rm(list=ls()) # remove everything currently held in the R memory
options(stringsAsFactors=FALSE)
graphics.off()

# Load libraries
install.packages("dplyer")
install.packages("tidyr")
library(dplyr)
library(tidyr)
library(ggplot2)

# Set Working Directory
setwd("~/Documents/git/hysterant/buo_PEP725_records")
rec1<-read.csv("buo_101_000_010.csv",header=TRUE)
attach(rec1)
#confirm there is only one column
head(rec1)
ncol(rec1)
nrow(rec1)
#seperateing 1 column into 9
sep_rec1<-separate(rec1,s_id.lon.lat.alt.plant_id.cult_id.bbch.year.day, into = "s_id","lon","lat","alt","plant_id","cult_id","bbch","year","day",sep=".")

#not working, make fake data to see if . ; agreement is the problem
dat <- data.frame(id = letters[1:5], "days.night" = c("1;2.5", "1;2", "1;3", "2;1.2", "2.1"),count = rpois(5, 20))
dat
dat_sep<-separate(dat, days.night, into= "days","nights",sep=".") 
#doesnt work either-change column name to ;
rename(rec1,c("s_id.lon.lat.alt.plant_id.cult_id.bbch.year.day" = "s_id;lon;lat;alt;plant_id;cult_id;bbch;year;day")) # didnt work
names(rec1)[names(rec1)=="s_id.lon.lat.alt.plant_id.cult_id.bbch.year.day"] <- "s_id;lon;lat;alt;plant_id;cult_id;bbch;year;day" #alternative method
head(rec1)
#try seperation again
sep_rec1<-separate(rec1,"s_id;lon;lat;alt;plant_id;cult_id;bbch;year;day",into= c("s_id","lon","lat","alt","plant_id","cult_id","bbch","year","day"), sep=";" )
head(sep_rec1)
sep_rec1
#rename to a more useful name
rec_1<-sep_rec1
#how many phenophase show up in the data frame? 
summarize(rec_1,n_distinct(bbch))

##Let's try something new: can we easily combine two different datasheets from the gigantic folder of options?
data.files = list.files()
install.packages("gdata")
library(gdata)
data.files = list.files(pattern = "*.csv")
data.to.merge <- lapply(data.files, read.csv) 
merged.data <- Reduce(function(...) merge(..., all = T),data.to.merge)#takes a long time

