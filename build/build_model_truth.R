source('../config.R')

model.truth = glm(Y~same.questions,
                  family=binomial(),
                  data=master.frame)

summary(model.truth)
