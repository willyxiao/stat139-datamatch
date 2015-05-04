source('config.R')

model.latent.eagerness = glm(Y~soph+junior+senior+grad+alum+hours,
                             family=binomial(),
                             data=master.frame)
summary(model.latent.eagerness)

