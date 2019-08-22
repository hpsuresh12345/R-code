getwd()
setwd("C:\\Suresha\\Reva\\Trimester 1\\Appliedstatisctics")
getwd()
data <- read.csv("demo.csv")
data
class(data)
summary(data)
print(ncol(data))
print

table(demo)

cor(Response)

install.packages('caTools',dependencies = T)
library(caTools)

set.seed(88)
split<-sample.split(demo$Response,SplitRatio = 0.75)
