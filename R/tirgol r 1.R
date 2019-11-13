df = iris
df

min(df$Sepal.Length,df$Sepal.Width,df$ngth,df$Petal.Width)

max(df$Sepal.Length)
max(df$Sepal.Width)
max(df$Petal.Length)
max(df$Petal.Width)

mean(df$Sepal.Length)
mean(df$Sepal.Width)
mean(df$Petal.Length)
mean(df$Petal.Width)

cf = mtcars
cf

sqrt(cf$mpg)

log(cf$disp)
cf$wt^3

s1<-c("age","gender","height","weight")
s1
s1 <- paste("age","gender","height","weight",sep="+")
s1

m1<-matrix(c(4,7,-8,3,0,-2,1,-5,12,-3,6,9),ncol=4)
m1           
rowMeans(m1)
colMeans(m1)
mean(m1)


az<-LETTERS
za<-order(az,decreasing =TRUE)
az[za]

y<-1 
for (x in 1:10) {
  print(x)
  if(x==8) 
    break
  }

for (x in 1:10) {
  print(x)
  if(x==8) 
    break
  }



  
 for (x in 1:10) {
      print(x)
      if(x==8) 
         break
     }

for (i in 1:40) {
  x <- sample(x=1:10,size =1)
  print(x)
  if(x==8){
    break
  }
}
x<-0
while(x!=8){
  x<-sample(x=1:10,size =1)
  print(x)
}





