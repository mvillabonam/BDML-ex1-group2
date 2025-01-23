# calculating the most commun value of maxEducLevel. 
mode_edu <- as.numeric(names(sort(table(db$maxEducLevel), decreasing = TRUE)[1]))
# Imputing the missing value. 
db <- db  %>%
  mutate(maxEducLevel = ifelse(is.na(maxEducLevel) == TRUE, mode_edu , maxEducLevel))

db$maxEducLevel<- factor(db$maxEducLevel)
dummy_maxEducLevel <- as.data.frame(model.matrix(~ maxEducLevel - 1, data = db)) 
#db<- db  %>% cbind(dummy_maxEducLevel) 
db <- cbind(db, dummy_maxEducLevel)

db %>% select(maxEducLevel,maxEducLevel1, maxEducLevel2,maxEducLevel3 ,maxEducLevel4 ,maxEducLevel5 ,maxEducLevel6, maxEducLevel7 ) %>% head() 

linear_imput_model <- lm(y_salary_m ~ ingtot + sex   + maxEducLevel3 + maxEducLevel4 + maxEducLevel5 + maxEducLevel6 + maxEducLevel7 , data = db)
summary(linear_imput_model)
