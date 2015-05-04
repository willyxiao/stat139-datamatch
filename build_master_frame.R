source('config.R')
source('load_data.R')
library(chron)

# BUILDING DATA
data.length = dim(post.wlng)[1]*2

Y = rep(NA, data.length)
id = rep(NA, data.length)
straight = rep(NA, data.length)
female = rep(NA, data.length)

dorm_id = rep(NA, data.length)

same.class = rep(NA, data.length)
same.house = rep(NA, data.length)

same.questions = rep(NA, data.length)

compat.score = rep(NA, data.length)

explicit.wlng = rep(NA, data.length)

soph = rep(NA, data.length) # 32
junior = rep(NA, data.length) # 33
senior = rep(NA, data.length) # 34
grad = rep(NA, data.length) # 35
alum = rep(NA, data.length) # 36

seconds_after_start = rep(NA, data.length)
dating = rep(NA, data.length)

start.time = as.POSIXlt("2015-02-07 19:20:00")

is.straight = function(gender_id, match_with_id){
  as.numeric((gender_id == 37 && match_with_id == 40) || (gender_id == 38 && match_with_id == 39))
}

# prior.wlng.map = function(wlng.code){
#   if(wlng.code == 151){
#     return(0)
#   } else if (wlng.code == 152){
#     return(-2)
#   } else if (wlng.code == 153){
#     return(-1)
#   } else if (wlng.code == 154){
#     return(1)
#   } else if (wlng.code == 155){
#     return(2)
#   } else{
#     stop("Invalid willingness code")
#   }
# }
for(i in 1:dim(post.wlng)[1]){
  if(i%%100 == 0){
    print(i)
  }
  Y[i*2 - 1] = post.wlng[i,]$u1_willing
  Y[i*2] = post.wlng[i,]$u2_willing

  u1 = users[users$id == post.wlng[i,]$u1_id,]
  u2 = users[users$id == post.wlng[i,]$u2_id,]
  
  straight[i*2 - 1] = is.straight(u1$gender_id, u1$match_with_id)
  straight[i*2] = is.straight(u2$gender_id, u2$match_with_id)
  
#   explicit.wlng[i*2 - 1] = prior.wlng.map(prior.wlng$answer_id[prior.wlng$user_id == u1$id])
#   explicit.wlng[i*2] = prior.wlng.map(prior.wlng$answer_id[prior.wlng$user_id == u2$id])
  
  female[i*2 - 1] = as.numeric(u1$gender_id == 38)
  female[i*2] = as.numeric(u2$gender_id == 38)
  
  same.class[i*2 - 1] = as.numeric(u1$class_year_id == u2$class_year_id)
  same.class[i*2] = as.numeric(u1$class_year_id == u2$class_year_id)
  
  same.house[i*2 - 1] = as.numeric(u1$dorm_id == u2$dorm_id)
  same.house[i*2] = as.numeric(u1$dorm_id == u2$dorm_id)
  
  same.questions[i*2 - 1] = as.numeric(user.similarities[i,]$similarity)
  same.questions[i*2] = as.numeric(user.similarities[i,]$similarity)
  
  compat.score[i*2 - 1] = as.numeric(user.similarities[i,]$compat_score)
  compat.score[i*2] = as.numeric(user.similarities[i,]$compat_score)
  
  id[i*2 -1] = as.numeric(u1$id)
  id[i*2] = as.numeric(u2$id)
  
  dorm_id[i*2 -1] = as.numeric(u1$dorm_id)
  dorm_id[i*2] = as.numeric(u2$dorm_id)

  soph[i*2 -1] = as.numeric(u1$class_year_id == 31)
  soph[i*2] = as.numeric(u2$class_year_id == 31)
  junior[i*2 -1] = as.numeric(u1$class_year_id == 32)
  junior[i*2] = as.numeric(u2$class_year_id == 32)
  senior[i*2 -1] = as.numeric(u1$class_year_id == 33)
  senior[i*2] = as.numeric(u2$class_year_id == 33)
  grad[i*2 -1] = as.numeric(u1$class_year_id == 34)
  grad[i*2] = as.numeric(u2$class_year_id == 34)
  alum[i*2 -1] = as.numeric(u1$class_year_id == 35)
  alum[i*2] = as.numeric(u2$class_year_id == 35)

  seconds_after_start[i*2 -1] = as.numeric(as.POSIXlt(u1$created_at) - start.time, units="secs")
  seconds_after_start[i*2] = as.numeric(as.POSIXlt(u2$created_at) - start.time, units="secs")

  dating[i*2 - 1] = as.numeric(u1$dating)
  dating[i*2] = as.numeric(u2$dating)
}

master.frame = data.frame(id, Y, straight, female, dorm_id, soph, junior, senior, grad, alum, seconds_after_start, dating, same.house, same.class, same.questions, compat.score)
master.frame = merge(master.frame, user.personality, by="id")