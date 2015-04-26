pairs = read.csv('pairs.csv', col.names=c('u1','u2'))
pairs = pairs[pairs$u2 != 0,]

users = read.csv('user_data.csv', 
                 col.names=c('id', 
                             'dorm_id', 
                             'class_year_id', 
                             'gender_id', 
                             'match_with_id', 
                             'created_at', 
                             'dating'))

prior.willingness = read.csv('prior_willingness.csv',
                             col.names=c('user_id', 'answer_id'))
posterior.willingness = read.csv('posterior_willingness.csv',
                                 col.names=c('u1_id', 'u2_id', 'u1_willing', 'u2_willing'))
