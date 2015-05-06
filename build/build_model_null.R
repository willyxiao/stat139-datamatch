source('../config.R')

model.null = glm(Y~1,
                  family=binomial(),
                  data=master.frame)

summary(model.null)

