

#Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

#Method 2: Set WD and read data
getwd()
setwd("/Users/albertsimonyan/Desktop/R Course")

rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats
demog <- read.csv("P2-Demographic-Data.csv")


#-------------- Exploring Data
stats
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)
# str() runif() rnorm()
summary(stats)
str(demog)

#------------ Using the $ sign
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats["Angola", 3]
stats$Internet.users[2]
stats[,"Internet.users"]
levels(demog$Income.Group)


#------------- Basic operations with a DF
stats[1:10,]
stats[c(4,100),]
is.data.frame(stats[1,]). # no need for drop=F
is.data.frame(stats[,1,drop=F])
stats[,1,drop=F]
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)
stats$MyCalc <- NULL
head(stats)


#------------ Filtering DF
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",]



#--------- Introduction to qplot
?qplot()
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")


#------------ Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      color=I("red"), size=I(4))

qplot(data=stats, x=Internet.users, y=Birth.rate,
      color=Income.Group, size=I(4))



#--------- Create a DF
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)
rm(mydf)


mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)



#-------- Merging the DF's
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x="Country.Code", by.y="Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)


#------- Visualizing with new split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)

#1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(3), shape=I(13))

#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(3), shape=I(13),
      alpha=I(0.6))

#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(3), shape=I(13),
      alpha=I(0.6), main="Birth Rate vs Internet Users")

















