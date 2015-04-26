pairs = read.csv('data/pairs.csv', header=F, col.names=c('u1','u2'))
pairs = pairs[pairs$u2 != 0,]

users = read.csv('data/user_data.csv', 
                 header=F,
                 col.names=c('id', 
                             'dorm_id', 
                             'class_year_id', 
                             'gender_id', 
                             'match_with_id', 
                             'created_at', 
                             'dating'))

prior.wlng = read.csv('data/prior_willingness.csv',
                      header=F,
                      col.names=c('user_id', 'answer_id'))
post.wlng = read.csv('data/posterior_willingness.csv',
                     header=F,
                     col.names=c('u1_id', 'u2_id', 'u1_willing', 'u2_willing'))

match.matrix = matrix(NA, nrow=max(users$id), ncol=max(users$id))
for(i in 1:dim(pairs)[1]){
  match.matrix[pairs[i,]$u1, pairs[i,]$u2] = 0
  match.matrix[pairs[i,]$u2, pairs[i,]$u1] = 0
}
for(i in 1:dim(post.wlng)[1]){
  match.matrix[post.wlng[i,]$u1_id, post.wlng[i,]$u2_id] = post.wlng[i,]$u1_willing
  match.matrix[post.wlng[i,]$u2_id, post.wlng[i,]$u1_id] = post.wlng[i,]$u2_willing
}

rm(post.wlng)
