source('config.R')

model.proximity = glm(Y~same.class+same.house,
                        family=binomial(),
                        data=master.frame)
summary(model.proximity)
