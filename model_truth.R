source('config.R')

model.truth = glm(Y~same.questions,
                  family=binomial(),
                  data=individual.data)

summary(model.truth)
