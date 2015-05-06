source('../config.R')

model.sexuality = glm(Y~straight+female,family=binomial(),data=master.frame)
summary(model.sexuality)
