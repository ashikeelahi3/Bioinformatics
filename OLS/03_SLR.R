rm(list=ls())
par(mfrow=c(1,1))
set.seed(123)
n=100 
beta_0 = 2
beta_1 = 3 
sigma = 1 

n_sim = 1000 

# Estimated beta without outliaers 
b0 = numeric(n_sim)
b1 = numeric(n_sim)

# Estimated beta with outliers
bw0 = numeric(n_sim)
bw1 = numeric(n_sim)

for(i in 1:n_sim){
  X = runif(n, min=0, max= 10)
  e = rnorm(n, 0, sigma)
  Y = beta_0 + beta_1 * X + e
  
  coef = coefficients(lm(Y ~ X))
  b0[i] = coef[1]
  b1[i] = coef[2]

  e[31:40] = rchisq(10, 100)
  Y = beta_0 + beta_1 * X + e
  coef = coefficients(lm(Y ~ X))
  bw0[i] = coef[1]
  bw1[i] = coef[2]
}

mean(b0)
mean(bw0)
sd(b0)
sd(bw0)
plot(1:n_sim, b0, type="l", col="red", xlab="Simulation", ylab="b0", ylim=c(-2, 22))
lines(1:n_sim, bw0, type="l", col="blue")
abline(h=mean(b0), col="black")
abline(h=mean(bw0), col="green")


mean(b1)
mean(bw1)
sd(b1)
sd(bw1)
plot(1:n_sim, b1, type="l", col="red", xlab="Simulation", ylab="b1")
lines(1:n_sim, bw1, type="l", col="blue")
abline(h=mean(b1), col="black")
abline(h=mean(bw1), col="green")
