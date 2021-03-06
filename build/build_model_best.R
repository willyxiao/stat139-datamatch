source('../config.R')

#Let's get rid of our variables with high correlation (kinky, creative, and twisted were highly 
#correlated with social)
base.model = glm(Y~.-id-age-house-oncampus-kinky-creative-twisted,
                 family=binomial(),
                 data=master.frame)

model.best = step(base.model,
                  scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                             upper=glm(Y~(.-id-age-house-oncampus-kinky-creative-twisted)^2,family=binomial(),data=master.frame)),
                  direction="both")
model.base.BIC = step(base.model,
                      scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                 upper=glm(Y~(.-id-age-house-oncampus-kinky-creative-twisted),family=binomial(),data=master.frame)),
                      direction="both",
                      k=log(nrow(master.frame)))

model.BIC.interactions = step(model.base.BIC, 
                              scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                                          upper=glm(Y~(.-id-age-house-oncampus-kinky-creative-twisted)^2,family=binomial(),data=master.frame)),
                                               direction="both",
                                               k=log(nrow(master.frame)))
#^this model was exactly the same as model.base.BIC -the step function ended up not using any interaction
#terms when using BIC as it's criteron


base.model.AIC_no_interactions = step(base.model,
                      scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                 upper=glm(Y~(.-id-age-house-oncampus-kinky-creative-twisted),family=binomial(),data=master.frame)),
                      direction="both")

model.base.AIC = step(base.model.AIC_no_interactions,
                      scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                 upper=glm(Y~(.-id-age-house-oncampus-kinky-creative-twisted)^2,family=binomial(),data=master.frame)),
                      direction="both")
save(model.base.BIC, file="data/model_base_BIC.RData")
save(model.base.AIC, file="data/model_base_AIC.RData")
save(model.best, file="data/model_best.RData")