db$maxEducLevel<- factor(db$maxEducLevel)

dummy_maxEducLevel <- as.data.frame(model.matrix(~ maxEducLevel - 1, data = db)) 
#db<- db  %>% cbind(dummy_maxEducLevel) 
db <- cbind(db, dummy_maxEducLevel)

db %>% select(maxEducLevel,maxEducLevel1, maxEducLevel2,maxEducLevel3 ,maxEducLevel4 ,maxEducLevel5 ,maxEducLevel6, maxEducLevel7 ) %>% head() # Include your code here for you second imputation method
