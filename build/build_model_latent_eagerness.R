source('../config.R')

model.latent.eagerness = glm(Y~soph+junior+senior+grad+alum+seconds_after_start,
                             family=binomial(),
                             data=master.frame)
summary(model.latent.eagerness)
