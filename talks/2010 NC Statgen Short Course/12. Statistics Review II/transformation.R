setwd("~/Dropbox/Teaching/2010 NC Statgen Short Course/12. Statistics Review II/")

#mar
#A numerical vector of the form c(bottom, left, top, right) which gives the number of lines of margin to be specified on the four sides of the plot. The default is c(5, 4, 4, 2) + 0.1.

X=rnorm(100)+1
epsiln = rnorm(100,0.1)
Y=3+2*X**2+epsiln

pdf("before.pdf")
par(cex.lab=1.5, mar=c(4, 5, 2, 5) + 0.1)
plot(X,Y)
m=lm(Y~X)
abline(m,col="red")
dev.off()

pdf("after.pdf")
X2 = X**2
par(cex.lab=1.5, mar=c(4, 5, 2, 5) + 0.1)
plot(X2,Y,xlab=expression(X^2))
ma=lm(Y~X2)
abline(ma,col="red")
dev.off()