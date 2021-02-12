install.packages("forecast", dependencies=TRUE)
library(AnalyzeTS)
library(MASS)
library(tseries)
library(forecast)
library(lmtest) 


dtinter <- read.csv("E:/Kuliah/PKL/databandara.csv",header = TRUE)
dtinter
dtintr <- ts(dtinter$Y, frequency = 12, start = c(1,1))
dtintr
plot(dtintr)
intr = log(dtinter$Y[1 :104])
intr
acf(dtinter$Y)
acf(intr,lag.max = 25)
pacf(intr, lag.max = 25)
adf.test(intr)
intrdiff <- diff(intr, lag=frequency(intr), differences = 1)
intrdiff
dtintrdiff <-ts(intrdiff, frequency = 12, start = c(1,1))
dtintrdiff
plot(dtintrdiff)
acf(intrdiff, lag.max = 25)
pacf(intrdiff, lag.max = 25)
adf.test(intrdiff)

fitintrdiff <- auto.arima(dtintr)
fitintrdiff
confint(fitintrdiff)
forecastedvalues_ln=forecast(fitintrdiff,h=10)
forecastedvalues_ln
plot(forecastedvalues_ln)
summary(fitintrdiff)

#coba1
fit_diff <- Arima(dtintr, order=c(0,1,2))
fit_diff
confint(fit_diff)
forecastedvalues_ln1=forecast(fit_diff,h=10)
forecastedvalues_ln1
plot(forecastedvalues_ln1)
summary(fit_diff)

#coba2
fit_diff2 <- Arima(dtintr, order=c(1,1,0))
fit_diff2
confint(fit_diff2)
forecastedvalues_ln1=forecast(fit_diff2,h=10)
forecastedvalues_ln1
plot(forecastedvalues_ln1)
summary(fit_diff2)

#coba3
fit_diff3 <- Arima(dtintr, order=c(1,1,2))
fit_diff3
confint(fit_diff3)
forecastedvalues_ln1=forecast(fit_diff3,h=10)
forecastedvalues_ln1
plot(forecastedvalues_ln1)
summary(fit_diff3)
