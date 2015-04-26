source('config.R')

# BUILDING DATA
# data.length = dim(post.wlng)[1]*2
# 
# Y = rep(NA, data.length)
# straight = rep(NA, data.length)
# female = rep(NA, data.length)
# 
# is.straight = function(gender_id, match_with_id){
#   as.numeric((gender_id == 37 && match_with_id == 40) || (gender_id == 38 && match_with_id == 39))
# }
# 
# for(i in 1:dim(post.wlng)[1]){
#   Y[i*2 - 1] = post.wlng[i,]$u1_willing
#   Y[i*2] = post.wlng[i,]$u2_willing
# 
#   u1 = users[users$id == post.wlng[i,]$u1_id,]
#   u2 = users[users$id == post.wlng[i,]$u2_id,]
#   
#   straight[i*2 - 1] = is.straight(u1$gender_id, u1$match_with_id)
#   straight[i*2] = is.straight(u2$gender_id, u2$match_with_id)
#   
#   female[i*2 - 1] = as.numeric(u1$gender_id == 38)
#   female[i*2] = as.numeric(u2$gender_id == 38)
# }

# LOAD DATA
load('data/model_sexuality_Y.RData') # Y
load('data/model_sexuality_X.RData') # X

model.sexuality = glm(Y~X$straight+X$female,family=binomial())
summary(model.sexuality)
