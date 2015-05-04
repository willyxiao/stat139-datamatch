source('config.R')

# LOAD DATA
load('data/individual_data.RData')

model.proximity = glm(Y~same.class+same.house,
                        family=binomial(),
                        data=individual.data)
summary(model.proximity)
