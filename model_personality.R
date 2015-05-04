source('config.R')

# LOAD DATA
load('data/individual_data.RData') # Y

model.personality = glm(Y~ambitious+cynical+athletic+kinky+nerdy+cultured+political+romantic+social+twisted+creative+boring+matchready+age+house+oncampus,
                             family=binomial(),
                             data=individual.data)
summary(model.personality)
