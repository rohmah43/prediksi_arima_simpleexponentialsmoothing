install.packages("forecast", dependencies=TRUE)
library(tseries)
library(forecast)

dtinter <- read.csv("E:/Kuliah/PKL/databandara.csv",header = TRUE)
dtinter
dtintr <- ts(dtinter$Y, frequency = 12, start = c(1,1))
dtintr
plot(dtintr)

#Fit simple exponential smoothing model to data and show summary
fit_ses <- ses(dtintr, h = 16)
summary(fit_ses)
#Plot the forecasted values
plot(fit_ses)
