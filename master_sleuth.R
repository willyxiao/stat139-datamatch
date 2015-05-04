source('config.R')

base.model = glm(Y~.-id-age-house-oncampus,
                 family=binomial(),
                 data=master.frame)

best.model = step(base.model,
                  scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                             upper=glm(Y~(.-id-age-house-oncampus)^2,family=binomial(),data=master.frame)),
                  direction="both")
