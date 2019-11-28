#linear regression
data <- Orange
mod <- lm(age ~ circumference,data = data)
summary(mod)
yhat <- predict(mod,data)
scatter.smooth(yhat ~ data$age)



#logistic regression 
data <- iris
head(data)
data$y <- ifelse(data$Species=="versicolor",1,0)
data$Species <- NULL
rnd <- sample(seq(1,nrow(data)))
data <-data[rnd,]
head(data)
mod <- glm(factor(y) ~  Sepal.Width + Petal.Length,data=data,family="binomial")
summary(mod)
pred <- predict(mod,data,type="respons")
hist(pred)
yhat<-ifelse(pred>=0.5,1,0)
table(yhat=yhat,y=data$y)
pred<-pred(mod,data,type="response")
hist(pred)
yhat<- ifelse(pred>=0.5,1,0)
table(yhat=yhat,y=data$y)

#acouracy <-
#acouracy
