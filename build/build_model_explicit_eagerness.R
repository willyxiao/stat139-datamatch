source('../config.R')

model.explicit.eagerness = glm(Y~dating+matchready,
                      family=binomial(),
                      data=master.frame)
summary(model.explicit.eagerness)
