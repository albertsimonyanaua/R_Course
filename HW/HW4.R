

df1960 <- data.frame(Code=Country_Code, Life_Expectancy_1960=Life_Expectancy_At_Birth_1960)
df2013 <- data.frame(Code=Country_Code, Life_Expectancy_2013=Life_Expectancy_At_Birth_2013)
mydf2 <- read.csv("P2-Section5-Homework-Data.csv")

head(mydf2)

head(df1960)
head(df2013)

data1960 <- mydf2[mydf2$Year == 1960,]
data1960$Life.Expectancy <- df1960$Life_Expectancy_1960
tail(data1960)
summary(data1960)

data2013 <- mydf2[mydf2$Year == 2013,]
data2013$Life.Expectancy <- df2013$Life_Expectancy_2013
summary(data2013)
head(data2013)

qplot(data=data1960, x=Fertility.Rate, y=Life.Expectancy, color=Region, 
      alpha=I(0.6), main="Life Expectancy vs Fertility Rate in 1960")

qplot(data=data2013, x=Fertility.Rate, y=Life.Expectancy, color=Region, 
      alpha=I(0.6), main="Life Expectancy vs Fertility Rate in 2013")






