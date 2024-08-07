

movies <- read.csv("P2-Movie-Ratings.csv")
getwd()

head(movies)
colnames(movies) <- c("Film", "Genre", 'CriticRating', "AudienceRating", "BudgetMillions", "Year")
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)

movies$Genre <- factor(movies$Genre)

summary(movies)
str(movies)


#--------- Aesthetics

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
  color=Genre, size=BudgetMillions)) + geom_point()


#--------- Plotting with Layers

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             color=Genre, size=BudgetMillions))

#points
p + geom_point()

#lines
p + geom_line()

#areas
p + geom_area()


#-------- Overriding Aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             color=Genre, size=BudgetMillions))
q + geom_point()

#Example 1
q + geom_point(aes(size=CriticRating))

#Example 2
q + geom_point(aes(color=BudgetMillions))

#Example 3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("BudgetMillions")

#Example 4
q + geom_line(size=1) + geom_point()



#------- Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#Mapping
r + geom_point(aes(color=Genre))
r + geom_point(aes(size=BudgetMillions))


#Setting
r + geom_point(color="DarkGreen")
r + geom_point(size=5)





#--------- Histograms and Density Charts
s <- ggplot(data=movies, aes(x=BudgetMillions))

s + geom_histogram(binwidth = 10) + ylab("Count")

s + geom_histogram(binwidth = 10, aes(fill=Genre)) + ylab("Count")

#add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") + ylab("Count")


s + geom_density(aes(fill=Genre), position = "stack")


#--------- Starting layer tips
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating),
                   fill="White", color="Blue")


t + geom_histogram(binwidth=10, aes(x=CriticRating),
                   fill="White", color="Blue")


#-------- Statistical Transformations
u <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               color = Genre))
u + geom_point() + geom_smooth(fill = NA)


#boxplots
l <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             color=Genre))
l + geom_boxplot()
l + geom_boxplot(size=1.2) + geom_point()
#tip / hack:
l + geom_boxplot(size=1.2) + geom_jitter()

l + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 

y <- ggplot(data=movies, aes(x=Genre, y=CriticRating,
                             color=Genre))
y + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)




#---------- Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))

v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")

#facets:

v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") +
  facet_grid(Genre~., scales="free")


#scatterplot:
w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               color=Genre))
w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

#--------- Coordinates

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             color=Genre))
m + geom_point() +
  xlim(50, 100) +
  ylim(50,100)

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") + 
  coord_cartesian(ylim=c(0,50))


w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))


#--------- Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), color='Black')

#axes labels
h + xlab("Money Axis") + ylab("Number of Movies")

h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

#legend formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="Darkblue",
                                  size=40,
                                  family="Courier"))











