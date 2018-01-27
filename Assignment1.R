---
  ###  
  
  ###
---
#1.  
#(a)
1:20

#(b) 
20:1

#(c) 
append(1:20,19:1,after = 20)

#(d) 
tmp <- c(4,6,3)

#(e) 
rep(tmp,10)

#(f) 
rep(tmp,10,31)

#(g) 
rep(tmp,c(10,20,30))

#2.
x <- seq(3,6,0.1)
exp(x)*cos(x)

#3.
#(a) 
(0.1^seq(3,36,3))*(0.2^seq(1,34,3))
#(b) 
((2^seq(1,25,1))/seq(1,25,1))

#4.
#(a)
a <- seq(10,100,1)
x = a^3
y = 4*(a^2)
sum(x+y)

#(b)
b <- seq(1,25,1)
sum((2^b/b)+(3^b)/b^2)

#5.
#(a)
paste(c("label"),seq(1,30,1),sep = " ")

#(b)
paste(c("fn"),seq(1,30,1),sep = "")

#6.
#(a)
set.seed(50)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
yVec[2:250]-xVec[1:249]

#(b)
sin(yVec[1:249])/cos(xVec[2:250])

#(c)
xVec[1:248]+2*xVec[2:249]-xVec[3:250]

#(d)
sum(exp(-xVec[2:250])/(xVec[1:249]+10))

#7. 
#(a)
v <- yVec[yVec>600]

#(b)
index <- match(v,yVec)

#(c)
xvalue <-xVec[index]

#(d)
xmean <- mean(xVec)
xVec2 <- abs(xVec-xmean)^0.5

#(e)
sortedY <- sort(yVec,decreasing = TRUE)
maxY <- sortedY[1]
lowerVal <- maxY-200
length(xVec[maxY>xVec & xVec>lowerVal])

#(f)
length(xVec[xVec%%2 == 0])

#(g)
sortedYincrease <- sort(yVec,decreasing = FALSE)
yindex2 <- match(sortedYincrease,yVec)
sort(xVec)[yindex2]

#(h)
indexY <- seq(1,250,3)
yVec[indexY]

#8.
sum(cumprod(seq(2,38,2)/seq(3,39,2)))+1