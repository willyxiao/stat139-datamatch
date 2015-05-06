#Make Plots for threshold results for AIC and BIC models
load("data/model_base_AIC.RData")
load("data/model_base_BIC.RData")

#Function below from http://stats.stackexchange.com
#/questions/25389/obtaining-predicted-values-y-1-or-0-from-a-logistic-regression-model-fit
# using a cutoff of cut, calculate sensitivity, specificity, and classification rate
perf = function(cut, fitted.values, y)
{
  yhat = (fitted.values > cut)
  w = which(y == 1)
  sensitivity = mean( yhat[w] == 1 ) 
  specificity = mean( yhat[-w] == 0 ) 
  c.rate = mean( y == yhat ) 
  d = cbind(sensitivity,specificity)-c(1,1)
  d = sqrt( d[1]^2 + d[2]^2 ) 
  out = t(as.matrix(c(sensitivity, specificity, c.rate,d)))
  colnames(out) = c("sensitivity", "specificity", "c.rate", "distance")
  return(out)
}

#make graph for AIC model
s = seq(.01, .99, length=10000)
OUT = matrix(0, 10000, 4)
for(i in 1:10000) {
  OUT[i,]=perf(s[i], model.base.AIC$fitted.values, master.frame$Y)
}
plot(s,OUT[,1],xlab="Cutoff",ylab="Value",cex.lab=1.5,cex.axis=1.5,ylim=c(0,1),type="l",lwd=2,axes=FALSE,col=2, main="Performance of Thresholds for AIC Model"
       )
axis(1,seq(0,1,length=5),seq(0,1,length=5),cex.lab=1.5)
axis(2,seq(0,1,length=5),seq(0,1,length=5),cex.lab=1.5)
lines(s,OUT[,2],col="darkgreen",lwd=2)
lines(s,OUT[,3],col=4,lwd=2)
lines(s,OUT[,4],col="darkred",lwd=2)
box()
legend("bottomright",.25,col=c(2,"darkgreen",4,"darkred"),lwd=c(2,2,2,2),c("Sensitivity","Specificity","Classification Rate","Distance"))


#make graph for BIC model
s = seq(.01, .99, length=10000)
OUT = matrix(0, 10000, 4)
for(i in 1:10000) {
  OUT[i,]=perf(s[i], model.base.BIC$fitted.values, master.frame$Y)
}
plot(s,OUT[,1],xlab="Cutoff",ylab="Value",cex.lab=1.5,cex.axis=1.5,ylim=c(0,1),type="l",lwd=2,axes=FALSE,col=2, main="Performance of Thresholds for BIC Model"
)
axis(1,seq(0,1,length=5),seq(0,1,length=5),cex.lab=1.5)
axis(2,seq(0,1,length=5),seq(0,1,length=5),cex.lab=1.5)
lines(s,OUT[,2],col="darkgreen",lwd=2)
lines(s,OUT[,3],col=4,lwd=2)
lines(s,OUT[,4],col="darkred",lwd=2)
box()
legend("bottomright",col=c(2,"darkgreen",4,"darkred"),lwd=c(2,2,2,2),c("Sensitivity","Specificity","Classification Rate","Distance"))
