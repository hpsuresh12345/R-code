data(AirPassengers)
class(AirPassengers)

start(AirPassengers)
end(AirPassengers)
AirPassengers
View(AirPassengers)

frequency(AirPassengers)

summary(AirPassengers)

plot(AirPassengers)

abline(reg=lm(AirPassengers~time(AirPassengers)))

cycle(AirPassengers)

plot(aggregate(AirPassengers,FUN=mean))

boxplot(AirPassengers~cycle(AirPassengers))

install.packages("dplyr",dependencies = T)

library(dplyr)

install.packages('tseries') 
require(tseries) 
?adf.test 

adf.test(diff(log(AirPassengers)), alternative="stationary", k=0)

acf(log(AirPassengers))

acf(diff(log(AirPassengers)))

pacf(diff(log(AirPassengers)))

(fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)))

pred <- predict(fit, n.ahead = 10*12)

ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))

library(Lahman)
install.packages("dplyr",dependencies = T)
library(dplyr)
?dplyr
