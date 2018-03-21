census <- read.csv('nyc_census.csv')
census <- data.frame(census)
names(census)
dim(census)

sum(is.na(census))
colSums(is.na(census))

census2 <- na.omit(census)
dim(census2) # 2095 versus the previous 2167 (not that much data loss)


# perhaps drop the columns where total population is 0 (since the rest of the values 
# for these are NA)

dim(census)
census3 <-census[!(census$TotalPop==0),]
dim(census3)
sum(is.na(census3)) #177 vs. 1269
colSums(is.na(census3))


# dont really want to replace with average values, we can just do na.omit and we lose less 
# than 100 values 

census4 <- na.omit(census3)
dim(census4)

nyc_census <- census4

2167 - 2095
72 #rows deleted out of 2167
72/2167 #around 3% of the data is lost (although a lot of that had population =0)
# so realistically we lost less than 3% 

summary(nyc_census)
total.cenus.pop <- sum(nyc_census$TotalPop)
#8,397,073


#pairs(nyc_census[1:10,])

# all the data 

names(nyc_census)
hist(nyc_census$Income) # trying to predict 
hist(nyc_census$IncomePerCap) # also trying to predict 


# split up data into boroughs 

brooklyn <- nyc_census[(nyc_census$Borough=='Brooklyn'),]
manhattan <- nyc_census[(nyc_census$Borough=='Manhattan'),]
queens <- nyc_census[(nyc_census$Borough=='Queens'),]
bronx <- nyc_census[(nyc_census$Borough=='Bronx'),]
staten.island <- nyc_census[(nyc_census$Borough=='Staten Island'),]

sum(brooklyn$TotalPop)
sum(manhattan$TotalPop)
sum(queens$TotalPop)
sum(bronx$TotalPop)
sum(staten.island$TotalPop)

# brooklyn, queen, manhattan, bronx, staten island 
# essentially the same order as teh amount of entries in boroughs. (Looking at summary)
# Also, county is irrelevant, could have split based on that because according to summary,
# it is a 1:1 ratio

#total hispanics in brooklyn approx 
brook.percentages <- (brooklyn$Hispanic)/100
brook.his <- sum(brook.percentages*brooklyn$TotalPop)
brook.his.percent <- brook.his/sum(brooklyn$TotalPop)

man.percentages <- (manhattan$Hispanic)/100
man.his <-sum(man.percentages*manhattan$TotalPop)
man.his.percent <- man.his/sum(manhattan$TotalPop)

qu.percentages <- (queens$Hispanic)/100
qu.his <- sum(qu.percentages*queens$TotalPop)
qu.his.percent <- qu.his/sum(queens$TotalPop)

bronx.percentages <- (bronx$Hispanic)/100
bronx.his <- sum(bronx.percentages*bronx$TotalPop)
bronx.his.percent <-bronx.his/sum(bronx$TotalPop)

si.percentages <- (staten.island$Hispanic)/100
si.his <- sum(si.percentages*staten.island$TotalPop)
si.his.percent <- si.his/sum(staten.island$TotalPop)

#White

brook.wpercentages <- (brooklyn$White)/100
brook.wh <- sum(brook.wpercentages*brooklyn$TotalPop)
brook.wh.percent <- brook.wh/sum(brooklyn$TotalPop)

man.wpercentages <- (manhattan$White)/100
man.wh <-sum(man.wpercentages*manhattan$TotalPop)
man.wh.percent <- man.wh/sum(manhattan$TotalPop)

qu.wpercentages <- (queens$White)/100
qu.wh <- sum(qu.wpercentages*queens$TotalPop)
qu.wh.percent <- qu.wh/sum(queens$TotalPop)

bronx.wpercentages <- (bronx$White)/100
bronx.wh <- sum(bronx.wpercentages*bronx$TotalPop)
bronx.wh.percent <-bronx.wh/sum(bronx$TotalPop)

si.wpercentages <- (staten.island$White)/100
si.wh <- sum(si.wpercentages*staten.island$TotalPop)
si.wh.percent <- si.wh/sum(staten.island$TotalPop)

#black

brook.bpercentages <- (brooklyn$Black)/100
brook.b <- sum(brook.bpercentages*brooklyn$TotalPop)
brook.b.percent <- brook.b/sum(brooklyn$TotalPop)

man.bpercentages <- (manhattan$Black)/100
man.b <-sum(man.bpercentages*manhattan$TotalPop)
man.b.percent <- man.b/sum(manhattan$TotalPop)

qu.bpercentages <- (queens$Black)/100
qu.b <- sum(qu.bpercentages*queens$TotalPop)
qu.b.percent <- qu.b/sum(queens$TotalPop)

bronx.bpercentages <- (bronx$Black)/100
bronx.b <- sum(bronx.bpercentages*bronx$TotalPop)
bronx.b.percent <-bronx.b/sum(bronx$TotalPop)

si.bpercentages <- (staten.island$Black)/100
si.b <- sum(si.bpercentages*staten.island$TotalPop)
si.b.percent <- si.b/sum(staten.island$TotalPop)

#native

brook.npercentages <- (brooklyn$Native)/100
brook.n <- sum(brook.npercentages*brooklyn$TotalPop)
brook.n.percent <- brook.n/sum(brooklyn$TotalPop)

man.npercentages <- (manhattan$Native)/100
man.n <-sum(man.npercentages*manhattan$TotalPop)
man.n.percent <- man.n/sum(manhattan$TotalPop)

qu.npercentages <- (queens$Native)/100
qu.n <- sum(qu.npercentages*queens$TotalPop)
qu.n.percent <- qu.n/sum(queens$TotalPop)

bronx.npercentages <- (bronx$Native)/100
bronx.n <- sum(bronx.npercentages*bronx$TotalPop)
bronx.n.percent <-bronx.n/sum(bronx$TotalPop)

si.npercentages <- (staten.island$Native)/100
si.n <- sum(si.npercentages*staten.island$TotalPop)
si.n.percent <- si.n/sum(staten.island$TotalPop)

#asian

brook.apercentages <- (brooklyn$Asian)/100
brook.a <- sum(brook.apercentages*brooklyn$TotalPop)
brook.a.percent <- brook.a/sum(brooklyn$TotalPop)

man.apercentages <- (manhattan$Asian)/100
man.a <-sum(man.apercentages*manhattan$TotalPop)
man.a.percent <- man.a/sum(manhattan$TotalPop)

qu.apercentages <- (queens$Asian)/100
qu.a <- sum(qu.apercentages*queens$TotalPop)
qu.a.percent <- qu.a/sum(queens$TotalPop)

bronx.apercentages <- (bronx$Asian)/100
bronx.a <- sum(bronx.apercentages*bronx$TotalPop)
bronx.a.percent <-bronx.a/sum(bronx$TotalPop)

si.apercentages <- (staten.island$Asian)/100
si.a <- sum(si.apercentages*staten.island$TotalPop)
si.a.percent <- si.a/sum(staten.island$TotalPop)

names.b <- c('Brooklyn', 'Bronx', 'Manhattan', 'Queens', 'Staten Island')
hisp <- c(brook.his.percent, bronx.his.percent, man.his.percent, qu.his.percent, si.his.percent)
bla <- c(brook.b.percent, bronx.b.percent, man.b.percent, qu.b.percent, si.b.percent)
wh <- c(brook.wh.percent, bronx.wh.percent, man.wh.percent, qu.wh.percent, si.wh.percent)
nat <- c(brook.n.percent, bronx.n.percent, man.n.percent, qu.n.percent, si.n.percent)
as <- c(brook.a.percent, bronx.a.percent, man.a.percent, qu.a.percent, si.a.percent)

data <- data.frame(names.b, hisp, bla, wh, nat, as)


library(ggplot2)
library(reshape)

#graph of percentages of each race each bourough 
data.m <- melt(data, id.vars='names.b')
ggplot(data.m, aes(names.b, value)) +   
  geom_bar(aes(fill = variable), position = "dodge", stat="identity")














