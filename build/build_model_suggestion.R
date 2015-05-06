source('../config.R')

model.suggestion = glm(Y~compat.score,
                       family=binomial(),
                       data=master.frame)
summary(model.suggestion)
