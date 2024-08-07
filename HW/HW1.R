c2 <- 0
for(i in rnorm(1000)){
  if(i <= 1 & i >= -1){
    c2 <- c2 + 1
  }
}

if(c2 / 1000 == 0.68){
  print("True")
}else{
  print("False")
}
