set.seed(123)
n=4
mean=c(5,6,3,7)
sd=c(2,3,1,4)

for (i in 1:n) {
  assign(paste0("x",i), rnorm(10,mean[i],sd[i]))
}

b0=2
b1=-3.4
b2=-5
b3=8
b4=1.8

b=cbind(b0,b1,b2,b3,b4)

e=rnorm(10,0,0.6)

Y=b0+b1*x1+b2*x2+b3*x3+b4*x4+e

data=data.frame(y,x1,x2,x3,x4,e)
data
x=cbind(1,x1,x2,x3,x4)
x
y=matrix(Y,ncol = 1)
y

xtx=t(x)%*%x
xtx.inv=solve(xtx)

xty=t(x)%*%y

beta.hat=xtx.inv%*%xty
print(t(b))
beta.hat

d=abs(t(b)-beta.hat)

d



