source('config.R')

base.model = glm(Y~straight+female+soph+junior+senior+grad+alum+seconds_after_start+dating+same.house+same.class+matchready,
                 family=binomial(),
                 data=master.frame)

model.inherent = step(base.model,
                  scope=list(lower=glm(Y~1,family=binomial(),data=master.frame),
                             upper=glm(Y~(straight+female+soph+junior+senior+grad+alum+seconds_after_start+dating+same.house+same.class+matchready)^2,family=binomial(),data=master.frame)),
                  direction="both")
