

mydata <- read.csv("P2-Mispriced-Diamonds.csv")

install.packages("ggplot2")

library(ggplot2)

ggplot(data = mydata[mydata$carat<2.5,], 
       aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.1) +
  geom_smooth()


#integer
x <- 2L
typeof(x)

#double
y <- 2.5
typeof(y)

#complex
z <- 3 + 2i
typeof(z)

#character
a <- "Albert"
typeof(a)


#logical
q1 <- T
q2 <- FALSE
typeof(q1)
typeof(q2)





