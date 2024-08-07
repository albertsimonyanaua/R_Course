#Named Vectors
Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c('a', 'b', 'c', 'd', 'e')
Charlie
Charlie['d']
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie



#Naming Matrix Dimensions 1
temp.vector <- rep(c('a', 'B', 'zZ'), times = 3)
temp.vector2 <- rep(c('a', 'B', 'zZ'), each = 3)
temp.vector2

Bravo <- matrix(temp.vector, 3, 3)
Bravo

rownames(Bravo) <- c(1, 2, 3)
colnames(Bravo) <- c('X', 'Y', 'Z')

Bravo

Bravo[1, 'Y'] <- 0
Bravo

rownames(Bravo) <- NULL
