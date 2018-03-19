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

#total hispanics in brooklyn approx 
percentages <- (brooklyn$Hispanic)/100
sum(percentages*brooklyn$TotalPop)

percentages <- (manhattan$Hispanic)/100
sum(percentages*manhattan$TotalPop)

percentages <- (queens$Hispanic)/100
sum(percentages*queens$TotalPop)

percentages <- (bronx$Hispanic)/100
sum(percentages*bronx$TotalPop)

percentages <- (staten.island$Hispanic)/100
sum(percentages*staten.island$TotalPop)

#can do this with white black native asian columns......









