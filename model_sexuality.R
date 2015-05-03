source('config.R')

# LOAD DATA
load('data/individual_data.RData') # Y

model.sexuality = glm(Y~straight+female,family=binomial(),data=individual.data)
summary(model.sexuality)
