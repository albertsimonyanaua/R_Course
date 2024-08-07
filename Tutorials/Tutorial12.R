

#matrix()
?matrix()
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5, byrow = TRUE)
A
A[2,5]

B <- matrix(my.data, 4, 5)
B
B[2,3]


#rbind()
r1 <- c('I', 'am', 'happy')
r2 <- c('What', 'a', 'day')
r3 <- c(1,2,3)

C <- rbind(r1, r2, r3)
C  

D <- cbind(r1,r2,r3)  
D  














  
  
  