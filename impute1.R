# calculating the most commun value of maxEducLevel. 
salary <- as.numeric(names(sort(table(db$y_salary_m), decreasing = TRUE)[1]))

# Imputing the missing value. 
db <- db  %>%
  mutate(y_salary_m = ifelse(is.na(y_salary_m) == TRUE, salary , y_salary_m))
