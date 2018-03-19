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
pairs(nyc_census[1:10,])






