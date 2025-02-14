rm(list=ls())
library(MASS)
set.seed(123)
n = 100

beta_0 = 2
beta_1 = 3

# Estimated beta using OLS 
b0 = numeric(n_sim)
b1 = numeric(n_sim)

# Estimated beta using GLS 
b0. = numeric(n_sim)
b1. = numeric(n_sim)

sigma = numeric(n)
sigma[1] = 1

x = runif(n, 0, 1)
e = numeric(n)
for(j in 1:n){
  e[j] = rnorm(1, 0, sigma)
  if(j < n)
    sigma[j+1] = sigma[j] + runif(1, 0, 1)
}

y = beta_0 + beta_1 * x + e

# OLS estimator
lm(y ~ x)
summary(lm(y ~ x))


# GLS estimator
data = data.frame(x, y, sigma)
gls_model = gls(y ~ x, weights = varFixed(~ sigma), data = data)
summary(gls_model)

