source('config.R')

# LOAD DATA
load('data/individual_data.RData') # Y

model.latent.eagerness = glm(Y~soph+junior+senior+grad+alum+hours,
                             family=binomial(),
                             data=individual.data)
summary(model.latent.eagerness)

