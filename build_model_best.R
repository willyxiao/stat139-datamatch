source('config.R')

base.model = glm(Y~.-id-age-house-oncampus,
                 family=binomial(),
                 data=master.frame)

best.model = step(base.model,
                  scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                             upper=glm(Y~(.-id-age-house-oncampus)^2,family=binomial(),data=master.frame)),
                  direction="both")

base.model.AIC = step(base.model,
                      scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                 upper=glm(Y~(.-id-age-house-oncampus),family=binomial(),data=master.frame)),
                      direction="both")

best.model.AIC = step(base.model.AIC,
                      scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                 upper=glm(Y~(.-id-age-house-oncampus)^2,family=binomial(),data=master.frame)),
                      direction="both")

base.model.BIC = step(base.model,
                  scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                             upper=glm(Y~(.-id-age-house-oncampus),family=binomial(),data=master.frame)),
                  direction="both",
                  k=log(nrow(master.frame)))

best.model.BIC = step(base.model.BIC,
                      scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                                 upper=glm(Y~(.-id-age-house-oncampus)^2,family=binomial(),data=master.frame)),
                      direction="both",
                      k=log(nrow(master.frame)))

