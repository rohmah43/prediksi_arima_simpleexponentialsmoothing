library(tseries)
library(forecast)

dtinter <- read.csv("E:/Kuliah/PKL/databandara.csv",header = TRUE)
dtinter
dtintr <- ts(dtinter$Y, frequency = 12, start = c(1,1))
dtintr
plot(dtintr)

#Melihat plot data aktual, trend, seasonality, dan random. 
components.ts = decompose(dtintr)
plot(components.ts)

#melakukan uji stasioneritas dengan ADF.test
adf.test(dtintr)

#Melihat plot ACF dan PACF, uji stasioneritas juga bisa dilihat dari plot ACF dan PACF
intr = log(dtinter$Y[1 :104])
intr
par(mfrow=c(1,2))
acf(intr,lag.max = 25)
pacf(intr,lag.max = 25)

#melakukan diffeencing
intrdiff <- diff(intr, lag=frequency(intr), differences = 1)
intrdiff
dtintrdiff <-ts(intrdiff, frequency = 12, start = c(1,1))
dtintrdiff
par(mfrow=c(1,1))
plot(dtintrdiff)
acf(intrdiff, lag.max = 25)
pacf(intrdiff, lag.max = 25)
adf.test(intrdiff)

#Menentukan nilai (p,d,q)
'''
Nilai d dilihat dari difference. Karena data ini sudah stasioner dan tidak melewati proses 
differencing, maka nilai d adalah 0.
Berdasarkan plot, dapat dilihat bahwa pada plot ACF cut off setelah lag 2 dan plot PACF cut off 
setelah lag 1. Sehingga model yang dapat digunakan adalah ARIMA(3,1,1), ARIMA(3,1,0) dan
ARIMA(0,1,1).

'''


#coba1
fit_diff <- Arima(dtintr, order=c(3,1,1))
fit_diff
confint(fit_diff)
forecastedvalues_ln1=forecast(fit_diff,h=3)
forecastedvalues_ln1
par(mfrow=c(1,1))
plot(forecastedvalues_ln1)
summary(fit_diff)

#coba2
fit_diff2 <- Arima(dtintr, order=c(3,1,0))
fit_diff2
confint(fit_diff2)
forecastedvalues_ln1=forecast(fit_diff2,h=3)
forecastedvalues_ln1
plot(forecastedvalues_ln1)
summary(fit_diff2)

#coba3
fit_diff3 <- Arima(dtintr, order=c(0,1,1))
fit_diff3
confint(fit_diff3)
forecastedvalues_ln1=forecast(fit_diff3,h=3)
forecastedvalues_ln1
plot(forecastedvalues_ln1)
summary(fit_diff3)
