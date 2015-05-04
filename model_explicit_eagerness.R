source('config.R')

model.explicit.eagerness = glm(Y~dating+explicit.wlng,
                      family=binomial(),
                      data=master.frame)
summary(model.explicit.eagerness)
