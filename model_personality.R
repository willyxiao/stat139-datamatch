source('config.R')

model.personality = glm(Y~ambitious+cynical+athletic+kinky+nerdy+cultured+political+romantic+social+twisted+creative+boring+matchready+age+house+oncampus,
                             family=binomial(),
                             data=master.frame)
summary(model.personality)
