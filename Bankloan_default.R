View(bankloan1)

install.packages('caTools',dependencies = T)
library(caTools)

set.seed(88)
split<-sample.split(bankloan$default,SplitRatio = 0.75)


#get training and test data
dresstrain <- subset(bankloan1, split == TRUE)
dresstest <- subset(bankloan1, split == FALSE)

model <- glm (default ~ ., data = bankloan1, family = binomial)
model
summary(model)

predict <- predict(model, type = 'response')
predict

#confusion matrix
table(dresstrain$default, predict >0.5)

length(dresstrain)
length(predict)

#ROCR Curve
install.packages('ROCR',dependencies = T)
library(ROCR)
ROCRpred <- prediction(predict, dresstrain$default)
ROCRperf <- performance(ROCRpred, 'default','income')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))

#plot glm
library(ggplot2)
ggplot(dresstrain, aes(x=income, y=default)) + geom_point() + 
  stat_smooth(method="glm", family="binomial", se=FALSE)
ggplot(dresstrain, aes(x=ed, y=default)) + geom_point() + 
  stat_smooth(method="glm", family="binomial", se=FALSE)