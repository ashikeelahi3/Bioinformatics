rm(list = ls())
par(mfrow=c(2,1))
set.seed(123)
n = 100        # Sample Size
beta_0 = 2
beta_1 = 3
sigma = 1      # SD of error term

# Number of simulations
n_sim = 1000

# Estimated beta
b0 = numeric(n_sim)  # Just a array of numbers
b1 = numeric(n_sim)

for(i in 1:n_sim){
  X = runif(n, min=0, max=10)
  e = rnorm(n, 0, sigma)
  
  Y = beta_0 + beta_1 * X + e
  lm(Y ~ X)
  coefficients(lm(Y ~ X))
  coef = coefficients(lm(Y ~ X))
  b0[i] = coef[1]
  b1[i] = coef[2]
}

plot(1:1000, b0, type="l", col="red", xlab="Simulation", ylab="b0")
abline(h=mean(b0), col="blue")
mean(b0)
sd(b0)

plot(1:1000, b1, type="l", col="red", xlab="Simulation", ylab="b1")
abline(h=mean(b1), col="blue")
mean(b1)
sd(b1)
