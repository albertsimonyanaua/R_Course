
install.packages("ggplot2")
library(ggplot2)

movies <- read.csv("Section6-Homework-Data.csv")

head(movies)
str(movies)
summary(movies)

filt <- (movies$Genre == "action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")
filt2 <- (movies$Studio == "Buena Vista Studios") | (movies$Studio == "WB") | (movies$Studio == "Fox") | (movies$Studio == "Universal") | (movies$Studio == "Sony") | (movies$Studio == "Paramount Pictures")

movies2 <- movies[filt & filt2, ]

movies$Genre <- factor(movies$Genre)
movies$Studio <- factor(movies$Studio)


ggplot(data=movies, aes(x=Day.of.Week)) + geom_bar()


p <- ggplot(data=movies2, aes(x=Genre, y=movies2$Gross...US))


myplot <- p + 
  geom_jitter(aes(size=Budget...mill., color=Studio)) +
  geom_boxplot(alpha=0.7, outlier.colour = NA) +
  xlab("Genre") + ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(text = element_text(family="Comic Sans MS"),
    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),
    
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),  
    
    plot.title = element_text(colour="Black",
                     size=40),
    
    legend.title = element_text(size=20),
    legend.text = element_text(size=12)
  )

myplot$labels$size = "Budget $M"
myplot




