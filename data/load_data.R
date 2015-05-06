users = read.csv('user_data.csv',
                 header=F,
                 col.names=c('id', 
                             'dorm_id', 
                             'class_year_id', 
                             'gender_id', 
                             'match_with_id', 
                             'created_at', 
                             'dating'))

prior.wlng = read.csv('prior_willingness.csv',
                      header=F,
                      col.names=c('user_id', 'answer_id'))
post.wlng = read.csv('posterior_willingness.csv',
                     header=F,
                     col.names=c('u1_id', 'u2_id', 'u1_willing', 'u2_willing'))

user.personality = na.omit(read.csv('user_personality.csv',
                                    header=F,
                                    col.names=c('id',
                                               'ambitious',
                                               'athletic',
                                               'boring',
                                               'creative',
                                               'cultured',
                                               'cynical',
                                               'kinky',
                                               'matchready',
                                               'nerdy',
                                               'political',
                                               'romantic',
                                               'social',
                                               'twisted',
                                               'age',
                                               'house',
                                               'oncampus')))

load("user_similarities.RData") # user.similarities