rm(list=ls())
library(mvtnorm)
library(lmtest)
library(ggplot2)
set.seed(79)

beta = c(1, 2, 3)
n = 1000
sigma = runif(n, min = 1, max = 10)

X = rmvnorm(n, mean = c(5, 2, 9), sigma = diag(c(4, 6, 7)))
e = rnorm(n, mean = 0, sd = sigma)
Y = X %*% beta + e
data = data.frame(Y, X)
data
model = lm(Y ~ ., data = data)
summary(model)

plot(model, which = 1)
# Perform Breusch-Pagan test
bptest(model)

sigma = sqrt(0.5+X %*% beta)
X = rmvnorm(n, mean = c(5, 2, 9), sigma = diag(c(4, 6, 7)))
e = rnorm(n, mean = 0, sd = sigma)
Y = X %*% beta + e
data = data.frame(Y, X)
data
model = lm(Y ~ ., data = data)
summary(model)

plot(model, which = 1)
# Perform Breusch-Pagan test
bptest(model)
