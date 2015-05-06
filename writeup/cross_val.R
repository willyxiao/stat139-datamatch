source('../config.R')
source('../load_all_models.R')

cross.val = function(models, ntests=10000, train.size=4000){
  prop.correct = matrix(NA, nrow=length(models), ncol=ntests)
  n = nrow(master.frame)
  
  for(i in 1:ntests){
    if(i%%10 == 0){
      print(i)
    }
    reorder = sample(n)
    train.set = master.frame[reorder[1:train.size],]
    test.set = master.frame[reorder[(train.size+1):n],]

    model.error = function(model){
      mean(sqrt((test.set$Y - 1/(1+exp(-predict(glm(formula(model),
                                                     family=binomial(),
                                                     data=train.set),
                                                 test.set))))^2))
    }
    
    prop.correct[,i] = do.call("cbind",lapply(models, model.error))
  }
  
  prop.correct
}

